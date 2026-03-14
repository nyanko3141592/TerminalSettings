#!/bin/bash
# TerminalSettings セットアップスクリプト
# シンボリックリンクで設定ファイルを配置する

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Ghostty
mkdir -p ~/.config/ghostty
ln -sf "$SCRIPT_DIR/ghostty.conf" ~/.config/ghostty/config
echo "✓ Ghostty: ~/.config/ghostty/config → ghostty.conf"

# tmux
ln -sf "$SCRIPT_DIR/tmux.conf" ~/.tmux.conf
echo "✓ tmux: ~/.tmux.conf → tmux.conf"

# TPM (tmux plugin manager) がなければインストール
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  echo "✓ TPM をインストールしました（tmux起動後に prefix+I でプラグインを取得）"
else
  echo "✓ TPM: インストール済み"
fi

echo ""
echo "完了！tmux を再起動してください。"
