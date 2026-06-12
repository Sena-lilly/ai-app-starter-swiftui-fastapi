#!/usr/bin/env python3
from __future__ import annotations

import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
LINK_RE = re.compile(r"\[[^\]]*\]\(([^)]+)\)")
SKIP_PREFIXES = ("http://", "https://", "mailto:", "#")


def iter_markdown_files() -> list[Path]:
    return sorted(
        path
        for path in ROOT.rglob("*.md")
        if ".git" not in path.parts and "backend/.venv" not in path.as_posix()
    )


def main() -> int:
    failures: list[str] = []
    for markdown_file in iter_markdown_files():
        text = markdown_file.read_text(encoding="utf-8")
        for match in LINK_RE.finditer(text):
            link = match.group(1)
            if link.startswith(SKIP_PREFIXES):
                continue

            target_text = link.split("#", 1)[0]
            if not target_text:
                continue

            target = (markdown_file.parent / target_text).resolve()
            if not target.exists():
                relative_file = markdown_file.relative_to(ROOT)
                failures.append(f"{relative_file}: {link}")

    if failures:
        print("Broken markdown links found:")
        for failure in failures:
            print(f"- {failure}")
        return 1

    print("OK: markdown relative links resolve.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
