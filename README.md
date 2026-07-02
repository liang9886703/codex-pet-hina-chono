# Codex Pets

Codex-compatible pet packages exported from the local Codex pet directory.

## Included pets

| Pet | Display name | Source |
| --- | --- | --- |
| `hina` | Hina | `pets/hina/` |

Each pet directory contains:

- `pet.json`
- `spritesheet.webp`

The sprite atlas uses the Codex pet layout: 8 columns x 9 rows, with 192 x 208 pixel cells.

## Install locally

Install one pet:

```bash
./tools/install.sh hina
```

The script copies files into:

```text
${CODEX_HOME:-$HOME/.codex}/pets/<pet-id>/
```

## Preview

GitHub README pages do not run custom JavaScript from embedded HTML files, so `preview.html` cannot be embedded as the interactive preview here. The README uses a generated GIF preview instead.

![Hina idle animation](docs/previews/hina-idle.gif)

For full atlas/state inspection, open `preview.html` in a browser and choose a pet/state. The preview page is static and does not require a build step.

## Repository layout

```text
.
├── README.md
├── preview.html
├── docs
│   └── previews
│       └── hina-idle.gif
├── pets
│   └── hina
│       ├── pet.json
│       └── spritesheet.webp
└── tools
    └── install.sh
```

## Notes

No license is declared in this export. Review asset rights before publishing the repository publicly.
