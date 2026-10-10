import argparse
from fractions import Fraction
from itertools import combinations, product
from math import factorial

import numpy as np
import sympy as sp


checked_assertions = 0


def require(condition, message):
    global checked_assertions
    if not bool(condition):
        raise AssertionError(message)
    checked_assertions += 1


def require_close(actual, expected, message, tolerance=1e-10):
    require(
        np.allclose(actual, expected, atol=tolerance, rtol=tolerance),
        message,
    )


def gf2_rank(matrix):
    reduced = np.array(matrix, dtype=np.int64, copy=True) % 2
    row_count, column_count = reduced.shape
    pivot_row = 0
    for column in range(column_count):
        candidates = np.flatnonzero(reduced[pivot_row:, column])
        if candidates.size == 0:
            continue
        selected = pivot_row + int(candidates[0])
        reduced[[pivot_row, selected]] = reduced[[selected, pivot_row]]
        for row in range(pivot_row + 1, row_count):
            if reduced[row, column]:
                reduced[row] ^= reduced[pivot_row]
        pivot_row += 1
        if pivot_row == row_count:
            break
    return pivot_row


def gf2_span(vectors, dimension):
    current = {(0,) * dimension}
    for vector in vectors:
        require(len(vector) == dimension, "Vector dimension mismatch")
        current |= {
            tuple((left + right) % 2 for left, right in zip(point, vector))
            for point in current
        }
    return frozenset(current)


def apply_mark(mark, vector):
    return tuple(int(entry) for entry in (mark @ np.array(vector)) % 2)


def response_chain(boundaries, seeds, marks, dimension):
    boundary_space = gf2_span(boundaries, dimension)
    for mark in marks:
        if any(apply_mark(mark, vector) not in boundary_space for vector in boundary_space):
            raise ValueError("The mark does not preserve the boundary subspace")
    current = gf2_span(list(boundaries) + list(seeds), dimension)
    boundary_dimension = len(boundary_space).bit_length() - 1
    dimensions = [len(current).bit_length() - 1 - boundary_dimension]
    while True:
        images = [apply_mark(mark, vector) for mark in marks for vector in current]
        following = gf2_span(list(current) + images, dimension)
        dimensions.append(len(following).bit_length() - 1 - boundary_dimension)
        if following == current:
            return dimensions, following
        current = following


def verify_triangle():
    boundary_one = np.array([[1, 0, 1], [1, 1, 0], [0, 1, 1]])
    boundary_two = np.ones((3, 1), dtype=np.int64)
    cycle = np.ones(3, dtype=np.int64)
    require(np.array_equal(boundary_one @ cycle % 2, np.zeros(3)), "Triangle is not a cycle")
    require(np.array_equal(boundary_one @ boundary_two % 2, np.zeros((3, 1))), "Boundary squared")
    require(gf2_rank(boundary_one) == 2, "Triangle boundary rank")
    require(gf2_rank(boundary_two) == 1, "Face boundary rank")
    betti_before = 3 - gf2_rank(boundary_one)
    betti_after = betti_before - gf2_rank(boundary_two)
    require((betti_before, betti_after) == (1, 0), "Triangle Betti numbers")
    require((2**betti_before, 2**betti_after) == (2, 1), "All quotient label counts")
    require((2**betti_before - 1, 2**betti_after - 1) == (1, 0), "Nonzero label counts")
    require(np.log2(2**betti_before) == 1, "Uniform quotient entropy")
    require(np.log2(2**betti_before - 1) == 0, "Uniform nonzero-label entropy")


def verify_response_modules():
    swap = np.array([[0, 1], [1, 0]])
    dimensions, _ = response_chain([(1, 1)], [(1, 0)], [swap], 2)
    require(dimensions == [1, 1], "Descended identity response")

    boundaries = [(0, 0, 1)]
    seeds = [(1, 0, 0)]
    shift = np.array([[0, 0, 0], [1, 0, 0], [0, 0, 0]])
    zero_mark = np.zeros((3, 3), dtype=np.int64)
    dimensions, closure = response_chain(boundaries, seeds, [shift], 3)
    require(dimensions == [1, 2, 2], "Strict response growth")
    require(np.array_equal(shift @ shift, zero_mark), "Nilpotent shift")
    require(response_chain(boundaries, seeds, [zero_mark], 3)[0] == [1, 1], "Mark dependence")
    require(response_chain(boundaries, [], [shift], 3)[0] == [0, 0], "Zero seed")
    require(response_chain(boundaries, seeds, [], 3)[0] == [1, 1], "No marks")
    require(response_chain(boundaries, [(1, 0, 1)], [shift], 3)[1] == closure, "Seed lift independence")
    full_basis = [(1, 0, 0), (0, 1, 0), (0, 0, 1)]
    require(response_chain(full_basis, seeds, [shift], 3)[0] == [0, 0], "Zero quotient")

    vectors = list(product((0, 1), repeat=3))
    candidates = {
        gf2_span([vector for index, vector in enumerate(vectors) if mask & (1 << index)], 3)
        for mask in range(1 << len(vectors))
    }
    required = gf2_span(boundaries + seeds, 3)
    for candidate in candidates:
        if required <= candidate and all(apply_mark(shift, vector) in candidate for vector in candidate):
            require(closure <= candidate, "Response is not minimal among invariant subspaces")

    invalid_mark = np.array([[0, 0, 1], [0, 0, 0], [0, 0, 0]])
    try:
        response_chain(boundaries, seeds, [invalid_mark], 3)
    except ValueError:
        require(True, "Invalid mark rejected")
    else:
        require(False, "Boundary-violating mark accepted")

    inclusion = np.array([[1], [0]])
    source_mark = np.zeros((1, 1), dtype=np.int64)
    target_mark = np.diag([0, 1])
    require(np.array_equal(inclusion @ source_mark, target_mark @ inclusion), "Strict intertwining")
    require(np.array_equal(inclusion @ np.array([1]), np.array([1, 0])), "Strict seed transport")
    require(np.any(target_mark != 0) and not np.any(source_mark), "Effective algebra counterexample")


def verify_symbolic_identities():
    variable = sp.symbols("variable")
    for multiplier in range(1, 7):
        series = sum(variable**power for power in range(multiplier))
        require(sp.expand((variable - 1) * series - (variable**multiplier - 1)) == 0, "Geometric series identity")
        for second_multiplier in range(1, 6):
            second = sum(variable ** (multiplier * power) for power in range(second_multiplier))
            combined = sum(variable**power for power in range(multiplier * second_multiplier))
            require(sp.expand(series * second - combined) == 0, "Arithmetic composition identity")

    dimension, codimension = sp.symbols("dimension codimension", positive=True)
    exponent = (1 + codimension) / (dimension - codimension)
    gap = codimension * (dimension + 1) / (dimension * (dimension - codimension))
    require(sp.simplify(exponent - 1 / dimension - gap) == 0, "Dirichlet threshold gap")
    require(sp.simplify((dimension + 1) / (1 + exponent) - (dimension - codimension)) == 0, "Codimension calibration")
    special_exponent = exponent.subs({dimension: 2, codimension: 1 / (64 * sp.pi**2)})
    require(sp.Rational(1, 2) < special_exponent < 1, "Calibrated case outside the old exponent range")


def verify_exact_torsion_and_thresholds():
    parameters = [
        (Fraction(0), Fraction(0)),
        (Fraction(1, 2), Fraction(0)),
        (Fraction(1, 3), Fraction(1, 4)),
        (Fraction(1, 2), Fraction(1, 2)),
        (Fraction(1, 3), Fraction(2, 3)),
    ]
    for parameter in parameters:
        for scale in range(1, 13):
            expected_zero = all((scale * coordinate).denominator == 1 for coordinate in parameter)
            row = [
                sp.simplify(sp.expand_complex(sp.exp(2 * sp.pi * sp.I * scale * sp.Rational(coordinate.numerator, coordinate.denominator)) - 1))
                for coordinate in parameter
            ]
            require(all(entry == 0 for entry in row) == expected_zero, "Exact rational torsion criterion")
            norm_squared = sp.simplify(sum(sp.conjugate(entry) * entry for entry in row))
            if expected_zero:
                require(norm_squared == 0, "Zero powered boundary row")
            else:
                filler = [sp.conjugate(entry) / norm_squared for entry in row]
                require(sp.simplify(sum(entry * coefficient for entry, coefficient in zip(row, filler))) == 1, "Exact rational filler")

    minimum_weighted_cost = sp.Rational(3, 2)
    for threshold, expected_empty in [(sp.Integer(1), True), (sp.Rational(3, 2), False), (sp.Integer(2), False)]:
        require(bool(minimum_weighted_cost > threshold) == expected_empty, "Closed feasible threshold")
    boundary_norm = sp.Integer(2)
    scale = sp.Integer(2)
    exponent = sp.Rational(3, 4)
    tolerance = boundary_norm * scale**exponent
    threshold = sp.simplify(scale ** (exponent + 1) / tolerance)
    require(boundary_norm == tolerance * scale ** (-exponent), "Strict recurrence threshold equality")
    require(scale / boundary_norm == threshold, "Weighted feasibility includes equality")


def verify_torus_relative_rank():
    for dimension in range(1, 6):
        coefficient_vectors = [[sp.Integer(0)] * dimension, [sp.Integer(-2)] * dimension]
        for active in range(dimension):
            coefficients = [sp.Integer(0)] * dimension
            coefficients[active] = sp.I - 1
            coefficient_vectors.append(coefficients)
        coefficient_vectors.append([sp.I - 1 if index % 2 else -2 for index in range(dimension)])
        for coefficients in coefficient_vectors:
            pairs = list(combinations(range(dimension), 2))
            differential = sp.zeros(len(pairs), dimension)
            for row, (first, second) in enumerate(pairs):
                differential[row, second] = coefficients[first]
                differential[row, first] = -coefficients[second]
            seed = sp.Matrix(coefficients)
            require((differential * seed).applyfunc(sp.simplify) == sp.zeros(len(pairs), 1), "Torus cocycle identity")
            relative_dimension = dimension - differential.rank()
            nonzero = any(coefficient != 0 for coefficient in coefficients)
            require(relative_dimension == (1 if nonzero else dimension), "Torus relative dimension")
            require(seed.rank() == (1 if nonzero else 0), "Torus seed rank")


def geometric_series(values, multiplier):
    return sum((values**power for power in range(multiplier)), start=np.zeros_like(values))


def verify_numeric_filling_and_diagrams(generator, sample_count):
    for _ in range(sample_count):
        dimension = int(generator.integers(1, 7))
        parameter = generator.uniform(-1, 1, dimension)
        scale = int(generator.integers(1, 25))
        multiplier = int(generator.integers(1, 7))
        second_multiplier = int(generator.integers(1, 6))
        holonomy = np.exp(2j * np.pi * scale * parameter)
        row = holonomy - 1
        norm = np.linalg.norm(row)
        filler = np.conjugate(row) / norm**2
        require_close(row @ filler, 1, "Numerical filling equation")
        require_close(np.linalg.norm(filler), 1 / norm, "Numerical reciprocal cost")
        require_close(np.linalg.pinv(row.reshape(1, -1)).ravel(), filler, "Independent pseudoinverse minimum")
        coefficients = generator.normal(size=dimension) + 1j * generator.normal(size=dimension)
        first_map = geometric_series(holonomy, multiplier)
        second_map = geometric_series(holonomy**multiplier, second_multiplier)
        total_map = geometric_series(holonomy, multiplier * second_multiplier)
        require_close(row * first_map, holonomy**multiplier - 1, "Numerical chain identity")
        require_close(first_map * second_map, total_map, "Numerical composition")
        require(np.max(np.abs(first_map)) <= multiplier + 1e-10, "Operator norm bound")
        require(scale * np.linalg.norm(first_map * coefficients) <= scale * multiplier * np.linalg.norm(coefficients) + 1e-9, "Weighted nonexpansiveness")
    require_close(geometric_series(np.ones(3, dtype=complex), 5), np.full(3, 5), "Power map at trivial holonomy")


def verify_numeric_signature_and_recurrence(generator, sample_count):
    for _ in range(sample_count):
        dimension = int(generator.integers(1, 7))
        first = generator.uniform(-1, 1, dimension)
        second = generator.uniform(-1, 1, dimension)
        quotient_difference = (first - second + 0.5) % 1 - 0.5
        torus_distance = np.linalg.norm(quotient_difference)
        first_holonomy = np.exp(2j * np.pi * first)
        second_holonomy = np.exp(2j * np.pi * second)
        chord = np.linalg.norm(first_holonomy - second_holonomy)
        signature_distances = []
        for scale in range(1, 33):
            difference = (first_holonomy**scale - second_holonomy**scale) / scale
            signature_distances.append(np.linalg.norm(difference))
            require(signature_distances[-1] <= chord + 1e-10, "Scale-one signature domination")
            row = np.exp(2j * np.pi * scale * first) - 1
            discrepancy = np.max(np.abs(scale * first - np.rint(scale * first)))
            norm = np.linalg.norm(row)
            require(4 * discrepancy <= norm + 1e-10, "Lower holonomy recurrence bound")
            require(norm <= 2 * np.pi * np.sqrt(dimension) * discrepancy + 1e-10, "Upper holonomy recurrence bound")
            reflected_norm = np.linalg.norm(np.exp(-2j * np.pi * scale * first) - 1)
            require_close(norm, reflected_norm, "Scalar profile reflection ambiguity")
        require_close(max(signature_distances), chord, "Exact signature metric on sampled scales")
        require(4 * torus_distance <= chord + 1e-10, "Lower signature metric bound")
        require(chord <= 2 * np.pi * torus_distance + 1e-10, "Upper signature metric bound")


def verify_numeric_carriers(generator, sample_count):
    for _ in range(sample_count):
        dimension = int(generator.integers(1, 7))
        radii = generator.uniform(0.5, 2, dimension)
        parameter = generator.uniform(0, 1, dimension)
        phases = np.exp(2j * np.pi * parameter)
        deviations = generator.normal(size=dimension)
        deviations *= 0.4 * np.min(radii) / np.linalg.norm(deviations)
        point = (radii + deviations) * phases
        projection = radii * point / np.abs(point)
        distance = np.linalg.norm(np.abs(point) - radii)
        require_close(np.linalg.norm(point - projection), distance, "Product distance formula")
        require(distance < np.min(radii), "Sub-reach sample")
        for time in (0.0, 0.25, 0.5, 0.75, 1.0):
            contracted = (1 - time) * point + time * projection
            require_close(np.linalg.norm(np.abs(contracted) - radii), (1 - time) * distance, "Radial contraction identity")
        nearest = radii.astype(complex)
        medial = nearest.copy()
        smallest = int(np.argmin(radii))
        medial[smallest] = 0
        alternate = nearest.copy()
        alternate[smallest] *= 1j
        require_close(np.linalg.norm(medial - nearest), radii[smallest], "Medial witness distance")
        require_close(np.linalg.norm(medial - alternate), radii[smallest], "Second nearest point")
        require(not np.allclose(nearest, alternate), "Nearest points must differ")
        other_parameter = generator.uniform(0, 1, dimension)
        torus_distance = np.linalg.norm((parameter - other_parameter + 0.5) % 1 - 0.5)
        weighted_chord = np.linalg.norm(radii * (phases - np.exp(2j * np.pi * other_parameter)))
        require(4 * np.min(radii) * torus_distance <= weighted_chord + 1e-10, "Anisotropic lower metric bound")
        require(weighted_chord <= 2 * np.pi * np.max(radii) * torus_distance + 1e-10, "Anisotropic upper metric bound")


def verify_restored_examples():
    first_holonomy, second_holonomy = sp.symbols("first_holonomy second_holonomy")
    coboundary_zero = sp.Matrix([first_holonomy - 1, second_holonomy - 1])
    coboundary_one = sp.Matrix([[1 - second_holonomy, first_holonomy - 1]])
    require(sp.simplify((coboundary_one * coboundary_zero)[0]) == 0, "Restored two-dimensional cocycle identity")
    torsion_substitution = {first_holonomy: -1, second_holonomy: 1}
    boundary = coboundary_zero.subs(torsion_substitution).T
    filler = sp.Matrix([sp.Rational(-1, 2), 0])
    require(boundary * filler == sp.Matrix([1]), "Powered-torsion example at q=1 fills")
    require((filler.T * filler)[0] == sp.Rational(1, 4), "Powered-torsion minimum squared norm")
    require(coboundary_one.subs(torsion_substitution).rank() == 1, "Full torus relative kernel is one dimensional")
    require(coboundary_zero.subs({first_holonomy: 1, second_holonomy: 1}) == sp.zeros(2, 1), "Powered-torsion example at q=2 has zero row and seed")
    for dimension in range(1, 5):
        for corner in product((0, 1), repeat=dimension):
            require(all(Fraction(coordinate) % 1 == 0 for coordinate in corner), "All cube corners represent the trivial character")
    rational_character = (Fraction(1, 4), Fraction(2, 5), Fraction(-1, 3))
    for image in product((-1, 0, 1), repeat=3):
        holonomy_exponent = sum(coordinate * coefficient for coordinate, coefficient in zip(rational_character, image))
        require((60 * holonomy_exponent).denominator == 1, "Common denominator trivializes pulled-back character powers")
    for stage in range(1, 6):
        denominator = 10 ** factorial(stage)
        partial = sum((Fraction(1, 10 ** factorial(index)) for index in range(1, stage + 1)), Fraction(0))
        later_partial = partial + sum((Fraction(1, 10 ** factorial(index)) for index in (stage + 1, stage + 2)), Fraction(0))
        finite_tail = later_partial - partial
        require((denominator * partial).denominator == 1, "Liouville partial sum has the stated denominator")
        require(0 < finite_tail < Fraction(2, 10 ** factorial(stage + 1)), "Finite Liouville tail respects geometric bound")
        require(denominator * finite_tail < Fraction(2, denominator ** stage), "Finite Liouville recurrence estimate")
    golden = (sp.sqrt(5) - 1) / 2
    conjugate = (-1 - sp.sqrt(5)) / 2
    for denominator in range(1, 65):
        numerator = int(sp.floor(denominator * golden + sp.Rational(1, 2)))
        approximation = sp.Rational(numerator, denominator)
        integer_norm = numerator ** 2 + numerator * denominator - denominator ** 2
        require(integer_norm != 0, "Golden-ratio rational approximation has nonzero integer norm")
        require(sp.simplify((approximation - golden) * (approximation - conjugate)) == sp.Rational(integer_norm, denominator ** 2), "Golden-ratio norm factorization")
        require(abs(approximation - conjugate) < 3, "Golden-ratio conjugate factor bound")
        require(abs(denominator * golden - numerator) > sp.Rational(1, 3 * denominator), "Golden-ratio recurrence lower bound")
    carrier = (Fraction(0), Fraction(2))
    for numerator in range(-3, 12):
        point = Fraction(numerator, 4)
        distances = [abs(point - candidate) for candidate in carrier]
        if min(distances) > Fraction(3, 4):
            continue
        projection = carrier[distances.index(min(distances))]
        for time in (Fraction(0), Fraction(1, 4), Fraction(1)):
            moved = (1 - time) * point + time * projection
            moved_distances = [abs(moved - candidate) for candidate in carrier]
            require(min(moved_distances) == (1 - time) * min(distances), "Two-point positive-reach carrier contracts distance exactly")
            require(carrier[moved_distances.index(min(moved_distances))] == projection, "Two-point carrier keeps the same nearest point along contraction")


def main():
    parser = argparse.ArgumentParser(description="Finite exact and sampled consistency checks for the reorganized manuscripts.")
    parser.add_argument("--samples", type=int, default=32)
    parser.add_argument("--seed", type=int, default=20260916)
    arguments = parser.parse_args()
    if arguments.samples < 1:
        parser.error("--samples must be positive")
    generator = np.random.default_rng(arguments.seed)
    groups = [
        ("finite triangle and label counts", verify_triangle),
        ("finite response modules and strict maps", verify_response_modules),
        ("symbolic arithmetic and calibration identities", verify_symbolic_identities),
        ("exact torsion and closed thresholds", verify_exact_torsion_and_thresholds),
        ("torus relative cocycles and ranks", verify_torus_relative_rank),
        ("restored examples and finite appendix estimates", verify_restored_examples),
        ("sampled filling and arithmetic diagrams", lambda: verify_numeric_filling_and_diagrams(generator, arguments.samples)),
        ("sampled signature and recurrence comparisons", lambda: verify_numeric_signature_and_recurrence(generator, arguments.samples)),
        ("sampled positive-reach carrier identities", lambda: verify_numeric_carriers(generator, arguments.samples)),
    ]
    for name, verification in groups:
        before = checked_assertions
        verification()
        print(f"PASS: {name} ({checked_assertions - before} checks)")
    print(f"All {checked_assertions} finite checks passed; seed={arguments.seed}, samples={arguments.samples}.")
    print("Finite sampling does not certify limsup membership, Hausdorff dimension, or universal theorems.")


if __name__ == "__main__":
    main()