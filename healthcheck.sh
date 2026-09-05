#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"

command -v python3 >/dev/null 2>&1 || { echo "FAIL: python3 not found"; exit 1; }

if [ -d .venv ]; then
  . .venv/bin/activate
else
  echo "WARN: .venv missing; run bash setup-codex.sh"
fi

python3 -m compileall -q .

[ -f .env ] || { echo "WARN: .env missing; run bash setup-codex.sh"; }
[ -f channels.txt ] || { echo "WARN: channels.txt missing; add YouTube channel handles before running"; }

if [ -f .env ]; then
  grep -Eq '^YOUTUBE_API_KEY=.+' .env && echo "OK: YOUTUBE_API_KEY configured" || echo "WARN: YOUTUBE_API_KEY not configured"
  grep -Eq '^ANTHROPIC_API_KEY=.+' .env && echo "OK: ANTHROPIC_API_KEY configured" || echo "WARN: ANTHROPIC_API_KEY not configured"
fi

echo "OK: Python sources compile"