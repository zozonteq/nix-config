# nix-config

> [!IMPORTANT]
> This nix config is unstable!

My personal dotfiles for MacOS(darwin)/Linux/NixOS/Android(nix-on-droid) written by Nix.

## 構造

このリポジトリは以下のように整理されています：

### 共通設定 (`lib/common.nix`)
- システム定義
- 共通のNix設定
- 共通のHome設定
- 共通のCLIモジュール
- プラットフォーム固有のモジュール

### ホスト設定 (`hosts/`)
- `linux/` - NixOS設定
- `darwin/` - macOS設定  
- `droid/` - Android設定
- `shared.nix` - 共通のホスト設定

### Home設定 (`home/`)
- `shared.nix` - 共通のHome設定
- `linux.nix` - Linux用設定
- `linux-desktop.nix` - デスクトップLinux用設定
- `darwin.nix` - macOS用設定
- `droid.nix` - Android用設定

### Home Manager設定 (`home-manager/`)
- 各アプリケーションの設定
- GUI、CLI、エディタなどの設定

## セットアップ

```bash
sh install_scripts/{HOSTNAME}.sh
```

## リファクタリング内容

- 重複コードの削減
- 共通設定の抽出
- より明確な構造化
- 保守性の向上
