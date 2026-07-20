# Theme packs

This repository contains two independent, portable Codex Dream Skin theme packs:

```text
themes/
├── hina-chono/
│   ├── theme.json
│   └── background.jpg
└── hina-chono-blue-white/
    ├── theme.json
    └── background.png
```

`hina-chono` is the original pink theme. `hina-chono-blue-white` is a separate blue-and-white theme whose palette follows Hina's striped shirt.

Install them with:

```bash
./tools/install-theme.sh hina-chono
./tools/install-theme.sh hina-chono-blue-white
```

The installer copies the complete pair into:

```text
~/Library/Application Support/CodexDreamSkinStudio/themes/<theme-id>/
```

It does not modify the Codex application and does not apply the theme unless `--apply` is explicitly supplied. Codex Dream Skin must already be installed before applying the theme.

This fan-art package is not covered by a redistribution license. See [`../NOTICE.md`](../NOTICE.md).
