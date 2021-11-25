#!/usr/bin/env python3
import ast
import glob
import os
import subprocess
import sys
from typing import Dict, List, Optional

# :execute "!python <SCRIPT>.py" expand("<cword>")
# Runs this script on the current word in your Vim buffer

def get_git_root() -> str:
    process = subprocess.run(
        ["git", "rev-parse", "--show-toplevel"], stdout=subprocess.PIPE
    )
    return process.stdout.strip().decode("utf-8")


def prepare_import_module(path: str, root_dir) -> str:
    relpath = os.path.relpath(path, root_dir)
    relpath = relpath.replace("/", ".")
    relpath = relpath[:-3]
    return relpath


def traverse_file(path: str, root_dir: str, symbols: Dict[str, List[str]]) -> None:
    module = prepare_import_module(path, root_dir)
    with open(path) as f:
        root = ast.parse(f.read(), path)

    for node in root.body:
        if isinstance(node, (ast.FunctionDef, ast.ClassDef)):
            name = node.name
            if name not in symbols:
                symbols[name] = []
            import_statement = f"from {module} import {name}"
            symbols[node.name].append(import_statement)


def traverse_directory(root_dir: str) -> Dict[str, List[str]]:
    symbols = {}
    for path in glob.glob(f"{root_dir}/**/*.py", recursive=True):
        if "tests" in path:
            continue
        traverse_file(path, root_dir, symbols)

    return symbols


def main() -> None:
    root = get_git_root()
    symbols = traverse_directory(root)
    symbol = sys.argv[1]
    matches = symbols.get(symbol)
    print()
    for match in matches:
        print(match)


if __name__ == "__main__":
    main()
