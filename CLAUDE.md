# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Is

Personal development environment documentation for macOS (Apple Silicon). Not a dotfiles repo — it tracks what's installed and how it's configured, not the config files themselves.

The main file is `DEV_ENVIRONMENT.md`, a living document of all installed tools, versions, and conventions.

## Key Conventions

- **Language**: Documentation is in Japanese
- **Aliases**: Existing commands (`cat`, `grep`, `find`, `cd`, `diff`) are NOT overridden. Modern alternatives (`bat`, `rg`, `fd`, `z`, `delta`) are used by their own names. Exception: `ls` → `eza`
- **Package managers**: Homebrew for system tools, pnpm for Node.js (not npm/yarn), uv for Python (not pip/poetry)
- **Shell**: Zsh with Starship prompt. Config files live in `~/.zshrc`, `~/.config/starship.toml`, `~/.config/ghostty/config` — not in this repo

## Updating DEV_ENVIRONMENT.md

When tools are added, removed, or updated, reflect the change in the appropriate table in `DEV_ENVIRONMENT.md`. Keep the format consistent with existing entries. Verify versions with actual CLI commands before writing.
