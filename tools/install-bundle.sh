#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APPLY_NOW="false"

case "${1:-}" in
  "") ;;
  --apply) APPLY_NOW="true" ;;
  -h|--help)
    printf 'Usage: ./tools/install-bundle.sh [--apply]\n'
    exit 0
    ;;
  *)
    echo "Unknown argument: $1" >&2
    exit 2
    ;;
esac

"$ROOT_DIR/tools/install.sh" hina
if [[ "$APPLY_NOW" == "true" ]]; then
  "$ROOT_DIR/tools/install-theme.sh" hina-chono --apply
else
  "$ROOT_DIR/tools/install-theme.sh" hina-chono
fi
