#!/bin/bash
# ============================================================
# TerminalSettings セットアップスクリプト
# pull → ./setup.sh でターミナル環境を一発構築
# ============================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== TerminalSettings セットアップ ==="
echo ""

# --- 1. Homebrew ---
if ! command -v brew &>/dev/null; then
  echo "▶ Homebrew をインストール中..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "✓ Homebrew: インストール済み"
fi

# --- 2. Brewfile でツール一括インストール ---
echo "▶ Brewfile からツールをインストール中..."
brew bundle --file="$SCRIPT_DIR/Brewfile" --no-lock
echo "✓ ツール: インストール完了"
echo ""

# --- 3. シンボリックリンク作成 ---
echo "▶ 設定ファイルをリンク中..."

# Zsh
ln -sf "$SCRIPT_DIR/zshrc" ~/.zshrc
echo "  ✓ zsh: ~/.zshrc → zshrc"

# Starship
mkdir -p ~/.config
ln -sf "$SCRIPT_DIR/starship.toml" ~/.config/starship.toml
echo "  ✓ Starship: ~/.config/starship.toml → starship.toml"

# Ghostty
mkdir -p ~/.config/ghostty
ln -sf "$SCRIPT_DIR/ghostty.conf" ~/.config/ghostty/config
echo "  ✓ Ghostty: ~/.config/ghostty/config → ghostty.conf"

# tmux
ln -sf "$SCRIPT_DIR/tmux.conf" ~/.tmux.conf
echo "  ✓ tmux: ~/.tmux.conf → tmux.conf"

echo ""

# --- 4. TPM (tmux plugin manager) ---
if [ ! -d ~/.tmux/plugins/tpm ]; then
  echo "▶ TPM をインストール中..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  echo "  ✓ TPM: インストール完了（tmux起動後に prefix+I でプラグイン取得）"
else
  echo "✓ TPM: インストール済み"
fi

echo ""
echo "=== セットアップ完了！ ==="
echo ""
echo "次のステップ:"
echo "  1. ターミナルを再起動（または source ~/.zshrc）"
echo "  2. tmux を起動して prefix+I でプラグインをインストール"
echo "  3. フォント 'PlemolJP Console NF' が未インストールの場合は別途導入"
