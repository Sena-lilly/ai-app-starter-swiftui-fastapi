#!/usr/bin/env python3
from __future__ import annotations

import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SKIP_DIRS = {
    ".git",
    ".venv",
    ".DerivedData",
    "__pycache__",
    ".pytest_cache",
}
SKIP_FILES = {
    "scripts/secret-audit.sh",
    "scripts/secret-pattern-scan.py",
}
PATTERN = re.compile(
    r"sk-[A-Za-z0-9]{20,}"
    r"|ghp_[A-Za-z0-9]{20,}"
    r"|github_pat_[A-Za-z0-9_]{20,}"
    r"|AKIA[0-9A-Z]{16}"
    r"|BEGIN (RSA |OPENSSH |EC |DSA |PRIVATE )?PRIVATE KEY"
)


def should_skip(path: Path) -> bool:
    relative = path.relative_to(ROOT).as_posix()
    return relative in SKIP_FILES or any(part in SKIP_DIRS for part in path.parts)


def main() -> int:
    matches: list[str] = []
    for path in ROOT.rglob("*"):
        if not path.is_file() or should_skip(path):
            continue
        try:
            text = path.read_text(encoding="utf-8")
        except UnicodeDecodeError:
            continue
        if PATTERN.search(text):
            matches.append(path.relative_to(ROOT).as_posix())

    if matches:
        print("\n".join(sorted(matches)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
