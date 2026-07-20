# Theme packs

`themes/hina-chono/` is a portable Codex Dream Skin theme pack:

```text
themes/hina-chono/
├── theme.json
├── background.png
└── background-pink.jpg
```

`background.png` is the active blue-and-white artwork. `background-pink.jpg` keeps the previous pink version as an optional source asset; `theme.json` determines which image is installed and applied.

Install it with:

```bash
./tools/install-theme.sh hina-chono
```

The installer copies the complete pair into:

```text
~/Library/Application Support/CodexDreamSkinStudio/themes/hina-chono/
```

It does not modify the Codex application and does not apply the theme unless `--apply` is explicitly supplied. Codex Dream Skin must already be installed before applying the theme.

This fan-art package is not covered by a redistribution license. See [`../NOTICE.md`](../NOTICE.md).
