"""Independent exact checks of the displayed figure formulas and saved assets."""
from fractions import Fraction as F
from pathlib import Path
import hashlib
import json

if not __debug__:
    raise RuntimeError('Assertions must be enabled for verification')

ROOT = Path(__file__).resolve().parents[1]


def verify(directory):
    data = json.loads((directory/'figure-data.json').read_text())
    count = 0
    assert data['classification'].startswith('Schematics and exact formula')
    assert F(data['eta']) == F(1, 4)
    roots = data['roots_positive_height']
    assert len(roots) == 16 and len({(r['x'], r['height']) for r in roots}) == 16
    for r in roots:
        x, h = F(r['x']), F(r['height'])
        assert abs(x) == F(1, 4) and h == 2**r['n'] and 1 <= r['n'] <= 8
        # For w=x+ih this is the real/imaginary square of w^2-z_n^2,
        # or w^2-conj(z_n)^2, according to the sign of x.
        assert x*x-h*h == F(1, 16)-4**r['n']
        assert abs(2*x*h) == h/2
        count += 1
    for row in data['count_endpoints']:
        h = F(row['H'])
        expected = 2*sum(F(2**n) <= h for n in range(1, 20))
        assert row['M'] == expected
        count += 1
    for row in data['secondary_bound_K1']:
        h, k = F(row['H']), row['k']
        # The plotted interval endpoint is explicitly the left limit.
        expected_m = 2*sum(F(2**n) < h if row['left_limit'] else F(2**n) <= h for n in range(1, 25))
        assert row['M_within_interval'] == expected_m == 2*k
        assert F(row['bound']) == 2*expected_m/h
        count += 1
    for row in data['compact_tail']:
        n = row['N']
        # Derive the infinite tail by geometric sums, independently of
        # the expanded coefficients in the figure generator.
        q4, q16 = F(1, 4), F(1, 16)
        exact = 2*3**2*q4**(n+1)/(1-q4) + 3**4*q16**(n+1)/(1-q16)
        assert F(row['B']) == exact
        partial = sum(2*F(9, 4**j)+F(81, 16**j) for j in range(n+1, n+50))
        assert 0 < partial < exact
        if exact < 1:
            assert F(row['tail_bound']) == exact/(1-exact)
        else:
            assert row['tail_bound'] is None
        count += 1
    endpoint = data['secondary_closed_endpoint']
    h = F(endpoint['H'])
    expected_m = 2*sum(F(2**n) <= h for n in range(1, 25))
    assert h == 2**20 and endpoint['M'] == expected_m == 40
    assert F(endpoint['bound']) == 2*expected_m/h == F(5, 65536)
    count += 1
    manifest = json.loads((directory/'MANIFEST.json').read_text())
    for name, digest in manifest['sha256'].items():
        assert hashlib.sha256((directory/name).read_bytes()).hexdigest() == digest,name
    for stem in ('figure-01-quotient-seams', 'figure-02-sparse-divisor', 'figure-03-certified-bounds'):
        assert (directory/(stem+'.pdf')).read_bytes().startswith(b'%PDF')
        assert '<svg' in (directory/(stem+'.svg')).read_text()
        assert (directory/(stem+'.png')).read_bytes().startswith(b'\x89PNG\r\n\x1a\n')
    return count


if __name__ == '__main__':
    n = verify(ROOT/'figures')
    print(f'Figure data/formula/asset checks: PASS ({n} exact rows)')
