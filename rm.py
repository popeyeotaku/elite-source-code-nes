#! /usr/bin/env python3
"""Fake implementation of the Unix `rm` command."""

from pathlib import Path
import shutil
from sys import argv
from typing import Iterable


def rm(files: Iterable[str]) -> None:
    """Remove all listed files."""
    for file in files:
        if file.startswith("-"):
            continue
        path = Path(file)
        if path.exists():
            if path.is_file():
                path.unlink(missing_ok=True)
            elif path.is_dir():
                shutil.rmtree(path)


if __name__ == "__main__":
    rm(argv[1:])
