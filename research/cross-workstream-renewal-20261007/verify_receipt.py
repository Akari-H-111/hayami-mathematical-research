"""Read-only file, frozen-source, development-binding and seed checks."""
import hashlib
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def check_manifest(path):
    count = 0
    for line in path.read_text().splitlines():
        wanted, name = line.split('  ', 1)
        assert digest(path.parent/name) == wanted, name
        count += 1
    return count


def run(receipt):
    manifests = []
    for item in receipt['manifests']:
        path = Path(item['path'])
        assert digest(path) == item['sha256'], path
        count = check_manifest(path)
        assert count == item['entries'], path
        manifests.append(count)
    for name, wanted in receipt['source_sha256'].items():
        assert digest(Path(name)) == wanted, name
    root = Path(receipt['ahr_root'])
    topic = root/'research/joint_phase_support'
    development_seeds = None
    for version in ['v0_01', 'v0_02', 'v0_03']:
        data = json.loads((topic/version/'development.json').read_text())
        seeds = {r['seed'] for r in data['rows']+data['null']}
        assert len(seeds) == 272
        if development_seeds is None: development_seeds = seeds
        assert seeds == development_seeds
        for name, wanted in data['source_hashes'].items():
            source = root/name
            if version == 'v0_03' and name == 'research/joint_phase_support/v0_03/study.py':
                binding = json.loads((topic/version/'DEVELOPMENT_SOURCE_BINDING.json').read_text())
                assert binding['sha256'] == wanted
                source = topic/version/binding['preserved_source']
            assert digest(source) == wanted, source
    confirmations = []
    for version, total in [('v0_01', 1664), ('v0_03', 1472)]:
        data = json.loads((topic/version/'confirmation.json').read_text())
        freeze = json.loads((topic/version/'FREEZE.json').read_text())
        assert freeze['source_hashes'] == data['source_hashes']
        for name, wanted in freeze['source_hashes'].items():
            assert digest(root/name) == wanted, name
        rows = data['rows']+data['null']
        seeds = {r['seed'] for r in rows}
        assert len(rows) == len(seeds) == total
        assert not seeds & development_seeds
        confirmations.append(seeds)
        assert 'PASS:' in (topic/version/'replay.log').read_text()
    assert not confirmations[0] & confirmations[1]
    assert json.loads((topic/'root_mixture_check.json').read_text())['status'] == 'PASS'
    return {'status': 'PASS', 'manifest_entries': manifests,
            'source_files': len(receipt['source_sha256']),
            'disjoint_confirmation_cases': sum(map(len, confirmations)),
            'development_source_bindings': 'PASS',
            'scope': 'preservation and provenance checks; numerical replays have separate recorded logs'}


if __name__ == '__main__':
    print(json.dumps(run(json.loads((HERE/'RECEIPT.json').read_text())), indent=2))
