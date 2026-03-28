# TerminalSettings

macOS (Apple Silicon) 開発環境のターミナル設定ファイル。
`git clone` → `./setup.sh` で環境構築が完了する。

## 含まれる設定

| ファイル | 対象 | 内容 |
|---------|------|------|
| `zshrc` | Zsh | fish風体験（autosuggestions / syntax-highlighting / fzf / zoxide） |
| `starship.toml` | [Starship](https://starship.rs/) | ミニマルプロンプト（git / node / python / 実行時間） |
| `ghostty.conf` | [Ghostty](https://ghostty.org/) | 背景透過、Catppuccin Mocha テーマ、PlemolJP Console NF フォント |
| `tmux.conf` | [tmux](https://github.com/tmux-plugins/tpm) | vim風キーバインド、ペインタイトルバー、非アクティブペイン減光 |
| `Brewfile` | [Homebrew](https://brew.sh/) | 必要ツールの一括インストール定義 |

## セットアップ

```bash
git clone https://github.com/nyanko3141592/TerminalSettings.git
cd TerminalSettings
./setup.sh
```

`setup.sh` が行うこと:

1. **Homebrew** が未インストールならインストール
2. **Brewfile** から全ツールを一括インストール
3. **シンボリックリンク** で設定ファイルを配置
4. **TPM** (tmux plugin manager) をインストール

| リンク先 | リンク元 |
|---------|---------|
| `~/.zshrc` | `zshrc` |
| `~/.config/starship.toml` | `starship.toml` |
| `~/.config/ghostty/config` | `ghostty.conf` |
| `~/.tmux.conf` | `tmux.conf` |

シンボリックリンクなので、`git pull` するだけで設定が同期される。

## セットアップ後

1. ターミナルを再起動（または `source ~/.zshrc`）
2. tmux 起動後に `prefix + I` でプラグインをインストール
3. フォント [PlemolJP Console NF](https://github.com/yuru7/PlemolJP) が未インストールなら別途導入

## 前提

- macOS (Apple Silicon)
- [PlemolJP Console NF](https://github.com/yuru7/PlemolJP) フォント（手動インストール）
