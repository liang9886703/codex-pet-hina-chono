#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PET_ROOT="$ROOT_DIR/pets"
TARGET_ROOT="${CODEX_HOME:-$HOME/.codex}/pets"

usage() {
  cat <<'USAGE'
Usage:
  ./tools/install.sh <pet-id>
  ./tools/install.sh all

Examples:
  ./tools/install.sh hina
  ./tools/install.sh all
USAGE
}

install_pet() {
  local pet_id="$1"
  local source_dir="$PET_ROOT/$pet_id"
  local target_dir="$TARGET_ROOT/$pet_id"

  if [[ ! -f "$source_dir/pet.json" || ! -f "$source_dir/spritesheet.webp" ]]; then
    echo "Pet not found or incomplete: $pet_id" >&2
    return 1
  fi

  mkdir -p "$target_dir"
  cp "$source_dir/pet.json" "$target_dir/pet.json"
  cp "$source_dir/spritesheet.webp" "$target_dir/spritesheet.webp"
  echo "Installed $pet_id -> $target_dir"
}

if [[ $# -ne 1 ]]; then
  usage >&2
  exit 2
fi

case "$1" in
  all)
    for pet_dir in "$PET_ROOT"/*; do
      [[ -d "$pet_dir" ]] || continue
      install_pet "$(basename "$pet_dir")"
    done
    ;;
  -h|--help)
    usage
    ;;
  *)
    install_pet "$1"
    ;;
esac
