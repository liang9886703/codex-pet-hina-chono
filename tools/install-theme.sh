#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
THEME_ID="hina-chono"
THEME_ID_SET="false"
APPLY_NOW="false"

usage() {
  cat <<'USAGE'
Usage:
  ./tools/install-theme.sh [theme-id] [--apply]

Examples:
  ./tools/install-theme.sh
  ./tools/install-theme.sh hina-chono
  ./tools/install-theme.sh hina-chono --apply
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --apply) APPLY_NOW="true"; shift ;;
    -h|--help) usage; exit 0 ;;
    -*) echo "Unknown argument: $1" >&2; usage >&2; exit 2 ;;
    *)
      [[ "$THEME_ID_SET" == "false" ]] || {
        echo "Only one theme id may be provided." >&2
        exit 2
      }
      THEME_ID="$1"
      THEME_ID_SET="true"
      shift
      ;;
  esac
done

case "$THEME_ID" in
  *[!A-Za-z0-9_-]*|'')
    echo "Theme id may contain only letters, numbers, underscores, and hyphens." >&2
    exit 2
    ;;
esac

SOURCE_DIR="$ROOT_DIR/themes/$THEME_ID"
CONFIG_PATH="$SOURCE_DIR/theme.json"
[[ -f "$CONFIG_PATH" ]] || {
  echo "Theme not found: $THEME_ID" >&2
  exit 1
}

CONFIG_ID="$(/usr/bin/plutil -extract id raw -o - "$CONFIG_PATH")"
IMAGE_NAME="$(/usr/bin/plutil -extract image raw -o - "$CONFIG_PATH")"
[[ "$CONFIG_ID" == "$THEME_ID" ]] || {
  echo "Theme id mismatch: directory=$THEME_ID config=$CONFIG_ID" >&2
  exit 1
}
[[ "$(basename "$IMAGE_NAME")" == "$IMAGE_NAME" && "$IMAGE_NAME" != "theme.json" ]] || {
  echo "Theme image must be a file inside its theme directory." >&2
  exit 1
}
[[ -s "$SOURCE_DIR/$IMAGE_NAME" ]] || {
  echo "Theme image missing or empty: $IMAGE_NAME" >&2
  exit 1
}

STATE_ROOT="${DREAM_SKIN_STATE_ROOT:-$HOME/Library/Application Support/CodexDreamSkinStudio}"
TARGET_DIR="$STATE_ROOT/themes/$THEME_ID"
/bin/mkdir -p "$TARGET_DIR"
/bin/chmod 700 "$TARGET_DIR"

# Copy the image first and theme.json last so the library never exposes a
# config that points at an incomplete image.
/bin/cp "$SOURCE_DIR/$IMAGE_NAME" "$TARGET_DIR/$IMAGE_NAME"
/bin/chmod 600 "$TARGET_DIR/$IMAGE_NAME"
/bin/cp "$CONFIG_PATH" "$TARGET_DIR/theme.json"
/bin/chmod 600 "$TARGET_DIR/theme.json"

echo "Installed theme $THEME_ID -> $TARGET_DIR"

SWITCHER="${CODEX_HOME:-$HOME/.codex}/codex-dream-skin-studio/scripts/switch-theme-macos.sh"
if [[ "$APPLY_NOW" == "true" ]]; then
  [[ -x "$SWITCHER" ]] || {
    echo "Codex Dream Skin switcher not found: $SWITCHER" >&2
    exit 1
  }
  exec "$SWITCHER" --id "$THEME_ID"
fi

printf 'Apply it with:\n  %q --id %q\n' "$SWITCHER" "$THEME_ID"
