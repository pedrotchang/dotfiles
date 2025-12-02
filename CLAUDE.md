# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles repository for macOS, Linux, and WSL2. Configuration files are symlinked to their target locations using the `setup` script, which auto-detects the platform.

## Setup

```bash
./setup
```

Platform detection: macOS (`darwin`), WSL2 (checks `/proc/version` for "microsoft"), native Linux.

### Common (all platforms)
- Neovim → `~/.config/nvim`
- k9s → `~/.config/k9s/skin.yml`
- eza → `~/.config/eza/eza.yml`
- tmux → `~/.tmux.conf`
- zsh → `~/.zshrc`, `~/.zprofile`

### macOS only
- Aerospace → `~/.config/aerospace/aerospace.toml`
- Karabiner → `~/.config/karabiner`
- Ghostty → `ghostty/config.macos`

### Linux only (native)
- Ghostty → `ghostty/config.linux`

### WSL2 only
- Alacritty → `alacritty/alacritty.toml`

## Architecture

### Neovim Configuration

- Uses lazy.nvim as plugin manager (bootstrapped in `nvim/lua/config/lazy.lua`)
- Leader key: `<Space>`, Local leader: `\`
- Colorscheme: gruvbox
- Plugins defined in `nvim/lua/config/plugins/*.lua`
- Custom zettelkasten module in `nvim/lua/zettelkasten/`

Key plugins: telescope, harpoon, oil, treesitter, LSP (via lsp.lua), mini.nvim, gitsigns

Notable keybindings:
- `-` opens Oil file browser
- `<Space><Space>x` sources current file
- `<Space>to` opens terminal split
- `<leader>lg` opens lazygit

### Shell Environment

Zsh with vi-mode, starship prompt, fzf integration. Key aliases:
- `v` → nvim
- `t` → tmux
- `g`, `gs`, `gp` → git shortcuts
- `k` → kubectl
- `lg` → lazygit
- `dot` → cd to dotfiles

Uses mise for runtime version management.

### Window Management (macOS)

Aerospace tiling window manager with vim-style navigation:
- `alt-hjkl` for focus
- `alt-shift-hjkl` for moving windows
- `alt-1..9` for workspaces
