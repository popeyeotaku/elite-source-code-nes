#! /usr/bin/env python3
"""Fake implementation of Unix `cat` command."""

from pathlib import Path
from sys import argv, stdout
from typing import Iterable


def cat(files: Iterable[str]) -> bytes:
    """Concatenate the bytes of all listed files."""
    output = bytes()
    for file in files:
        output += Path(file).read_bytes()
    return output


if __name__ == "__main__":
    stdout.buffer.write(cat(argv[1:]))
