#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"

if [ ! -d .venv ]; then
  echo "Virtual environment missing. Run bash setup-codex.sh first." >&2
  exit 1
fi

. .venv/bin/activate
python main.py