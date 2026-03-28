# ============================================================
# Zsh Configuration - Fish-like Experience
# ============================================================

# --- Environment ---
export EDITOR="nvim"
export LANG="en_US.UTF-8"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# --- Completion System ---
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
autoload -Uz compinit
compinit -C

# completion styling (fish-like)
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

# --- History ---
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_REDUCE_BLANKS

# --- Key Options ---
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS
setopt NO_BEEP

# --- Aliases ---
# 新しい短縮名のみ。既存コマンド(cat,grep,find,cd,diff)は上書きしない
alias ls='eza --icons'
alias ll='eza -la --icons --git'
alias lt='eza --tree --icons --level=2'

# git shortcuts
alias g='git'
alias gs='git status'
alias gd='git diff'
alias gl='git log --oneline -20'
alias gp='git push'
alias lg='lazygit'
alias c='clear'

# --- Tool Integrations ---

# zoxide (smart cd)
eval "$(zoxide init zsh)"

# fzf (fuzzy finder)
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# --- Plugins (fish-like behavior) ---

# autosuggestions (fish-style gray text suggestions)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
bindkey '^ ' autosuggest-accept  # Ctrl+Space to accept suggestion

# syntax highlighting (must be last plugin)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- Prompt (Starship) ---
eval "$(starship init zsh)"
export PATH="$HOME/.local/bin:$PATH"
