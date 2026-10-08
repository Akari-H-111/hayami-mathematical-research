#!/usr/bin/env python3
"""Verify the English edition inventory without modifying historical sources."""
from pathlib import Path
import hashlib, json, re
root = Path(__file__).resolve().parents[2]
manifest = json.loads((Path(__file__).parent / "MANIFEST.json").read_text())
assert manifest["complete"] and not manifest["pending"]
cjk = re.compile("[\\u3400-\\u9fff\\u3040-\\u30ff\\uac00-\\ud7af]")
for entry in manifest["entries"] + manifest["archive_member_editions"]:
    relative = Path(entry["english"])
    assert not relative.is_absolute() and ".." not in relative.parts
    content = (root / relative).read_bytes()
    assert hashlib.sha256(content).hexdigest() == entry["english_sha256"], str(relative)
    assert not cjk.search(content.decode("utf-8")), str(relative)
print(f"PASS: {len(manifest['entries'])} source editions and {len(manifest['archive_member_editions'])} archive-member editions; hashes and language scan.")
print("This checks inventory and bytes, not mathematical correctness or semantic equivalence.")
