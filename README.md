# TerminalSettings

macOS (Apple Silicon) 開発環境のターミナル設定ファイル。

## 含まれる設定

| ファイル | 対象 | 内容 |
|---------|------|------|
| `ghostty.conf` | [Ghostty](https://ghostty.org/) | 背景透過、Catppuccin Mocha テーマ、PlemolJP Console NF フォント |
| `tmux.conf` | [tmux](https://github.com/tmux-plugins/tpm) | vim風キーバインド、ペインタイトルバー、非アクティブペイン減光 |

## セットアップ

```bash
git clone https://github.com/nyanko3141592/TerminalSettings.git
cd TerminalSettings
./setup.sh
```

`setup.sh` はシンボリックリンクを作成するので、`git pull` するだけで設定が同期される。

| リンク先 | リンク元 |
|---------|---------|
| `~/.config/ghostty/config` | `ghostty.conf` |
| `~/.tmux.conf` | `tmux.conf` |

TPM (tmux plugin manager) が未インストールの場合は自動でインストールされる。tmux 起動後に `prefix + I` でプラグインを取得すること。

## 前提

- macOS (Apple Silicon)
- Homebrew
- [Ghostty](https://ghostty.org/)
- [PlemolJP Console NF](https://github.com/yuru7/PlemolJP) フォント
