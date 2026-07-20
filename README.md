# 蝶野雏 Codex Theme & Pet

一套非官方的蝶野雏 Codex 桌面组合包，包含：

- Codex Dream Skin 的「蝶野雏 · 粉色小宇宙」主题；
- Codex 原生宠物格式的 Hina 九状态动画包。

主题通过 [Codex Dream Skin](https://github.com/liang9886703/Codex-Dream-Skin) 的本机回环 CDP 注入使用，不修改官方 Codex 应用、`app.asar` 或代码签名。宠物包直接安装到 Codex 用户目录。

> This is an unofficial fan-made package. It is not affiliated with or endorsed by OpenAI, the *Blue Box* rights holders, or the character creators. See [NOTICE.md](./NOTICE.md) before redistribution.

![蝶野雏粉色小宇宙主题背景](themes/hina-chono/background.jpg)

## 包含内容

| 类型 | ID | 显示名称 | 路径 |
| --- | --- | --- | --- |
| Theme | `hina-chono` | 蝶野雏 · 粉色小宇宙 | `themes/hina-chono/` |
| Pet | `hina` | Hina | `pets/hina/` |

主题包内含：

- `theme.json`
- `background.jpg`（3200 × 1801）

宠物包内含：

- `pet.json`
- `spritesheet.webp`（8 列 × 9 行，单元格 192 × 208）

## 安装

### 一次安装主题和宠物

先安装 [Codex Dream Skin](https://github.com/liang9886703/Codex-Dream-Skin)；然后在本仓库执行：

```bash
./tools/install-bundle.sh
```

这会安装：

```text
~/.codex/pets/hina/
~/Library/Application Support/CodexDreamSkinStudio/themes/hina-chono/
```

默认不会自动切换当前主题。立即应用主题可执行：

```bash
./tools/install-bundle.sh --apply
```

### 分别安装

只安装宠物：

```bash
./tools/install.sh hina
```

只安装主题：

```bash
./tools/install-theme.sh hina-chono
```

安装后手动切换主题：

```bash
~/.codex/codex-dream-skin-studio/scripts/switch-theme-macos.sh \
  --id hina-chono
```

## 打包 ZIP

生成只包含 Hina 主题、宠物、预览和安装脚本的分发包：

```bash
./tools/build-package.sh
```

默认输出：

```text
dist/codex-hina-chono-bundle.zip
```

也可以显式指定输出路径：

```bash
./tools/build-package.sh /path/to/codex-hina-chono-bundle.zip
```

## 宠物动画预览

GitHub README 不执行嵌入 HTML 的 JavaScript，因此这里使用生成好的 GIF。GIF 采用浅色棋盘背景便于查看透明区域；Codex 实际使用的仍是 `pets/hina/spritesheet.webp`。

| Idle | Running right | Running left |
| --- | --- | --- |
| ![Hina idle animation](docs/previews/hina-idle.gif) | ![Hina running right animation](docs/previews/hina-running-right.gif) | ![Hina running left animation](docs/previews/hina-running-left.gif) |

| Waving | Jumping | Failed |
| --- | --- | --- |
| ![Hina waving animation](docs/previews/hina-waving.gif) | ![Hina jumping animation](docs/previews/hina-jumping.gif) | ![Hina failed animation](docs/previews/hina-failed.gif) |

| Waiting | Running | Review |
| --- | --- | --- |
| ![Hina waiting animation](docs/previews/hina-waiting.gif) | ![Hina running animation](docs/previews/hina-running.gif) | ![Hina review animation](docs/previews/hina-review.gif) |

完整 atlas/state 检查可在浏览器打开 `preview.html`，选择 Hina 与对应状态。该页面是静态文件，不需要构建。

## 仓库结构

```text
.
├── README.md
├── NOTICE.md
├── preview.html
├── docs/previews/              # Hina 九状态 GIF
├── pets/hina/
│   ├── pet.json
│   └── spritesheet.webp
├── themes/
│   ├── README.md
│   └── hina-chono/
│       ├── theme.json
│       └── background.jpg
└── tools/
    ├── install.sh              # 安装宠物
    ├── install-theme.sh        # 安装主题
    ├── install-bundle.sh       # 安装主题 + 宠物
    └── build-package.sh        # 构建组合 ZIP
```

## 权利与分发

本仓库没有为角色、作品、美术素材或第三方知识产权授予许可。公开再分发、制作 Release 或商业使用前，请自行完成权利审核。详见 [NOTICE.md](./NOTICE.md)。
