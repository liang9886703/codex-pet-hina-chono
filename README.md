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

## README preview

GitHub README pages do not run custom JavaScript from embedded HTML files, so `preview.html` cannot be embedded as the interactive preview here. The README uses generated GIF previews instead. These GIFs are composited on a light checker background to avoid black frames in GitHub's renderer; the actual Codex pet package still uses `pets/hina/spritesheet.webp`.

| Idle | Running right | Running left |
| --- | --- | --- |
| ![Hina idle animation](docs/previews/hina-idle.gif) | ![Hina running right animation](docs/previews/hina-running-right.gif) | ![Hina running left animation](docs/previews/hina-running-left.gif) |

| Waving | Jumping | Failed |
| --- | --- | --- |
| ![Hina waving animation](docs/previews/hina-waving.gif) | ![Hina jumping animation](docs/previews/hina-jumping.gif) | ![Hina failed animation](docs/previews/hina-failed.gif) |

| Waiting | Running | Review |
| --- | --- | --- |
| ![Hina waiting animation](docs/previews/hina-waiting.gif) | ![Hina running animation](docs/previews/hina-running.gif) | ![Hina review animation](docs/previews/hina-review.gif) |

For full atlas/state inspection, open `preview.html` in a browser and choose a pet/state. The preview page is static and does not require a build step.

## Repository layout

```text
.
├── README.md
├── preview.html
├── docs
│   └── previews
│       ├── hina-failed.gif
│       ├── hina-idle.gif
│       ├── hina-jumping.gif
│       ├── hina-review.gif
│       ├── hina-running-left.gif
│       ├── hina-running-right.gif
│       ├── hina-running.gif
│       ├── hina-waiting.gif
│       └── hina-waving.gif
├── pets
│   └── hina
│       ├── pet.json
│       └── spritesheet.webp
└── tools
    └── install.sh
```

## Notes

No license is declared in this export. Review asset rights before publishing the repository publicly.
