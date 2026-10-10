#!/usr/bin/env python3
"""Check the maintained reading routes and unchanged Information Topology inputs."""

from hashlib import sha256
from pathlib import Path
import re
from urllib.parse import unquote, urlsplit

ROOT = Path(__file__).resolve().parents[1]
GUIDES = (
    'README.md', 'AGENTS.md', 'RESEARCH_BOARD.md', 'ESTABLISHED_WORKS.md',
    'docs/REPOSITORY_GUIDE.md', 'verification/README.md', 'papers/README.md',
    'papers/inverse-leibniz/README.md', 'papers/information-topology/README.md',
    'papers/information-topology/figures/README.md', 'papers/legacy-geometry/README.md',
    'papers/legacy-geometry/orthogonal-circle-ruled-surface/README.md',
    'papers/legacy-geometry/stokes-caustic/README.md',
)
SERIES = ROOT / 'papers/information-topology'
MANUSCRIPTS = (
    'Foundations_of_Information_Exclusion.tex',
    'Arithmetic_Local_System_Filling_Spectra.tex',
    'Minimal_Marked_Response_Modules.tex',
)


def heading_ids(text):
    counts = {}
    result = set()
    for heading in re.findall(r'^#{1,6}\s+(.+?)\s*#*$', text, re.M):
        slug = re.sub(r'[^\w\- ]', '', heading.lower()).replace(' ', '-')
        count = counts.get(slug, 0)
        result.add(slug if count == 0 else f'{slug}-{count}')
        counts[slug] = count + 1
    return result


def main():
    assert __debug__, 'Run without Python -O'
    assert heading_ids('# A title\n## A title\n') == {'a-title', 'a-title-1'}
    links = 0
    for relative in GUIDES:
        page = ROOT / relative
        text = re.sub(r'^```.*?^```\s*$', '', page.read_text(), flags=re.M | re.S)
        for href in re.findall(r'(?<!!)\[[^\]\n]+\]\(([^)\s]+)\)', text):
            url = urlsplit(href)
            if url.scheme or url.netloc:
                continue
            target = (page.parent / unquote(url.path)).resolve() if url.path else page
            assert target.is_relative_to(ROOT), f'{relative}: outside repository: {href}'
            assert target.exists(), f'{relative}: missing destination: {href}'
            if url.fragment:
                assert target.suffix == '.md', f'{relative}: unsupported fragment: {href}'
                assert unquote(url.fragment) in heading_ids(target.read_text()), f'{relative}: missing heading: {href}'
            links += 1
    catalogue = (ROOT / 'README.md').read_text()
    assert len(re.findall(r'^\| (?:Inverse-Leibniz|Information Topology|Geometry:)', catalogue, re.M)) == 10
    manifest = (SERIES / 'SOURCE_SHA256SUMS.txt').read_text().splitlines()
    assert len(manifest) == 35, 'Unexpected source-import inventory'
    paths = set()
    for line in manifest:
        digest, relative = line.split('  ', 1)
        path = SERIES / relative
        assert path.resolve().is_relative_to(SERIES), relative
        assert relative not in paths, f'Duplicate source: {relative}'
        paths.add(relative)
        assert sha256(path.read_bytes()).hexdigest() == digest, f'Source hash mismatch: {relative}'
        if path.suffix == '.tex':
            for command, name in re.findall(r'\\(input|bibliography)\{([^}]+)\}', path.read_text()):
                suffix = '.tex' if command == 'input' else '.bib'
                dependency = name if Path(name).suffix else name + suffix
                assert dependency in paths or (SERIES / dependency).is_file(), f'{relative}: missing input: {dependency}'
    assert all(name in paths for name in MANUSCRIPTS)
    print(f'PASS: {len(GUIDES)} reading guides, {links} local links, ten current papers, 35 source hashes and TeX inputs.')
    print('Scope: local navigation and source integrity; no live DOI or mathematical certification.')


if __name__ == '__main__':
    main()
