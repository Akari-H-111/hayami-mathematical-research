"""Check normalization sensitivity and fail-closed execution of figure tooling."""
from pathlib import Path
from fractions import Fraction
import json
import tempfile
import unittest

from verify_figures import ROOT, verify


class FigureChecksTest(unittest.TestCase):
    def test_missing_secondary_factor_two_is_detected(self):
        data = json.loads((ROOT/'figures/figure-data.json').read_text())
        row = data['secondary_bound_K1'][0]
        row['bound'] = str(Fraction(row['bound'])/2)
        with tempfile.TemporaryDirectory() as d:
            p = Path(d)
            (p/'figure-data.json').write_text(json.dumps(data))
            with self.assertRaises(AssertionError): verify(p)

    def test_wrong_dyadic_endpoint_is_detected(self):
        data = json.loads((ROOT/'figures/figure-data.json').read_text())
        data['count_endpoints'][1]['M'] -= 2
        with tempfile.TemporaryDirectory() as d:
            p = Path(d)
            (p/'figure-data.json').write_text(json.dumps(data))
            with self.assertRaises(AssertionError): verify(p)

    def test_assertion_stripping_is_rejected(self):
        for name in ('build_figures.py', 'verify_figures.py'):
            p = Path(__file__).with_name(name)
            for level in (1, 2):
                with self.subTest(file=name, optimize=level):
                    with self.assertRaisesRegex(RuntimeError, 'Assertions must be enabled'):
                        exec(compile(p.read_text(), str(p), 'exec', optimize=level),
                             {'__name__': '__main__', '__file__': str(p)})


if __name__ == '__main__': unittest.main()
