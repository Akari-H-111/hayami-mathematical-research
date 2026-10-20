"""Test fail-closed guards using compiled code objects; never launch Python -O."""

from contextlib import redirect_stdout
from io import StringIO
from pathlib import Path
import unittest


class AssertionGuardTest(unittest.TestCase):
    def test_optimized_code_objects_refuse_verification(self):
        for filename in ("check_exact.py", "supervisor_countermodel.py"):
            path = Path(__file__).with_name(filename)
            for level in (1, 2):
                with self.subTest(filename=filename, optimization=level):
                    output = StringIO()
                    code = compile(path.read_text(), str(path), "exec", optimize=level)
                    with redirect_stdout(output):
                        with self.assertRaisesRegex(RuntimeError, "Assertions must be enabled"):
                            exec(code, {"__name__": "__main__", "__file__": str(path)})
                    self.assertNotIn("PASS", output.getvalue())


if __name__ == "__main__":
    unittest.main()
