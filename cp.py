#! /usr/bin/env python3
"""Fake implementation of Unix `cp` command."""

from pathlib import Path
import shutil
from sys import argv


def cp(files: list[str]) -> None:
    """Unix `cp`."""
    if len(files) < 2:
        raise ValueError("must have at least one source and one destination")
    dest = files[-1]
    sources = [file for file in files[:-1] if not file.startswith("-")]

    if len(sources) == 1:
        shutil.copy(sources[0], dest)
    else:
        for src in sources:
            shutil.copy(src, Path(dest) / Path(src).name)


if __name__ == "__main__":
    cp(argv[1:])
