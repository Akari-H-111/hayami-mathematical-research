"""Ensure continuation verifiers fail closed if assertions are stripped."""

from contextlib import redirect_stdout
from io import StringIO
from pathlib import Path
import unittest


class AssertionGuardTest(unittest.TestCase):
    def test_optimized_code_refuses_verification(self):
        for name in ("verify_canonical_product.py", "verify_complex_factors.py"):
            path = Path(__file__).with_name(name)
            for level in (1, 2):
                with self.subTest(verifier=name, optimization=level):
                    code = compile(path.read_text(), str(path), "exec", optimize=level)
                    output = StringIO()
                    with redirect_stdout(output):
                        with self.assertRaisesRegex(RuntimeError, "Assertions must be enabled"):
                            exec(code, {"__name__": "__main__", "__file__": str(path)})
                    self.assertNotIn("PASS", output.getvalue())


if __name__ == "__main__":
    unittest.main()
