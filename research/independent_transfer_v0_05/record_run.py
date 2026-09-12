"""Record actual subprocess output, preserving nonzero exit statuses."""
from pathlib import Path
import subprocess
import sys

log = Path(sys.argv[1])
with log.open("x",encoding="utf-8") as stream:
    stream.write("COMMAND: "+repr(sys.argv[2:])+"\n")
    stream.flush()
    process = subprocess.Popen(sys.argv[2:],stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True)
    for line in process.stdout:
        print(line,end="",flush=True)
        stream.write(line)
        stream.flush()
    code = process.wait()
    stream.write(f"EXIT STATUS: {code}\n")
raise SystemExit(code)
