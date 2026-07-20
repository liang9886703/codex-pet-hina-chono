#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUTPUT="${1:-$ROOT_DIR/dist/codex-hina-chono-bundle.zip}"
case "$OUTPUT" in
  /*) ;;
  *) OUTPUT="$PWD/$OUTPUT" ;;
esac
PACKAGE_NAME="codex-hina-chono-bundle"
TEMP_ROOT="$(/usr/bin/mktemp -d /tmp/codex-hina-package.XXXXXX)"
PACKAGE_ROOT="$TEMP_ROOT/$PACKAGE_NAME"

cleanup() {
  /bin/rm -rf "$TEMP_ROOT"
}
trap cleanup EXIT

/bin/mkdir -p \
  "$PACKAGE_ROOT/docs" \
  "$PACKAGE_ROOT/pets" \
  "$PACKAGE_ROOT/themes" \
  "$PACKAGE_ROOT/tools"

/bin/cp "$ROOT_DIR/README.md" "$PACKAGE_ROOT/README.md"
/bin/cp "$ROOT_DIR/NOTICE.md" "$PACKAGE_ROOT/NOTICE.md"
/bin/cp "$ROOT_DIR/preview.html" "$PACKAGE_ROOT/preview.html"
/bin/cp -R "$ROOT_DIR/docs/previews" "$PACKAGE_ROOT/docs/previews"
/bin/cp -R "$ROOT_DIR/pets/hina" "$PACKAGE_ROOT/pets/hina"
/bin/cp "$ROOT_DIR/themes/README.md" "$PACKAGE_ROOT/themes/README.md"
/bin/cp -R "$ROOT_DIR/themes/hina-chono" "$PACKAGE_ROOT/themes/hina-chono"
/bin/cp "$ROOT_DIR/tools/install.sh" "$PACKAGE_ROOT/tools/install.sh"
/bin/cp "$ROOT_DIR/tools/install-theme.sh" "$PACKAGE_ROOT/tools/install-theme.sh"
/bin/cp "$ROOT_DIR/tools/install-bundle.sh" "$PACKAGE_ROOT/tools/install-bundle.sh"
/bin/cp "$ROOT_DIR/tools/build-package.sh" "$PACKAGE_ROOT/tools/build-package.sh"
/bin/chmod 755 "$PACKAGE_ROOT/tools/"*.sh

/usr/bin/find "$PACKAGE_ROOT" -type f \( -name '.DS_Store' -o -name '._*' \) -delete
/usr/bin/xattr -cr "$PACKAGE_ROOT"
/bin/mkdir -p "$(dirname "$OUTPUT")"
/bin/rm -f "$OUTPUT"
(
  cd "$TEMP_ROOT"
  /usr/bin/zip -q -r -X "$OUTPUT" "$PACKAGE_NAME"
)

echo "Built $OUTPUT"
