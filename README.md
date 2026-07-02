# Codex Pets

Codex-compatible pet packages exported from the local Codex pet directory.

## Included pets

| Pet | Display name | Source |
| --- | --- | --- |
| `hina` | Hina | `pets/hina/` |
| `liangbyte` | LiangByte | `pets/liangbyte/` |

Each pet directory contains:

- `pet.json`
- `spritesheet.webp`

The sprite atlas uses the Codex pet layout: 8 columns x 9 rows, with 192 x 208 pixel cells.

## Install locally

Install one pet:

```bash
./tools/install.sh hina
```

Install all bundled pets:

```bash
./tools/install.sh all
```

The script copies files into:

```text
${CODEX_HOME:-$HOME/.codex}/pets/<pet-id>/
```

## Preview

Open `preview.html` in a browser and choose a pet/state. The preview page is static and does not require a build step.

## Repository layout

```text
.
├── README.md
├── preview.html
├── pets
│   ├── hina
│   │   ├── pet.json
│   │   └── spritesheet.webp
│   └── liangbyte
│       ├── pet.json
│       └── spritesheet.webp
└── tools
    └── install.sh
```

## Notes

No license is declared in this export. Review asset rights before publishing the repository publicly.
