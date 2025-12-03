# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles repository for macOS, Linux, and WSL2. Configuration files are symlinked to their target locations using the `setup` script, which auto-detects the platform.

## Setup

```bash
./setup
```

Platform detection: macOS (`darwin`), WSL2 (checks `/proc/version` for "microsoft"), Omarchy (checks for `~/.local/share/omarchy`), native Linux.

### Common (all platforms)
- Neovim → `~/.config/nvim`
- k9s → `~/.config/k9s/skin.yml`
- eza → `~/.config/eza/eza.yml` (from `eza/theme.yml`)
- tmux → `~/.tmux.conf`
- zsh → `~/.zshrc`, `~/.zprofile`

Starship prompt is auto-installed if missing.

### macOS only
- Aerospace → `~/.config/aerospace/aerospace.toml`
- Karabiner → `~/.config/karabiner`
- Ghostty → `ghostty/config.macos`

### Linux only (native)
- Ghostty → `ghostty/config.linux`

### WSL2 only
- Alacritty → `alacritty/alacritty.toml`

### Omarchy only
- Hyprland custom config → `~/.config/hypr/custom.conf` (copied, not symlinked)
- Adds `source` line to `~/.config/hypr/hyprland.conf`

Custom Hyprland settings:
- No borders (`border_size = 0`, `gaps_in = 0`, `gaps_out = 0`)
- Vim-style focus: `Super + HJKL`
- Vim-style swap: `Super + Shift + HJKL`
- Vim-style resize: `Super + Alt + HJKL`

## Architecture

### Neovim Configuration

- Uses lazy.nvim as plugin manager (bootstrapped in `nvim/lua/config/lazy.lua`)
- Leader key: `<Space>`, Local leader: `\`
- Colorscheme: everforest (hard background)
- Plugins defined in `nvim/lua/config/plugins/*.lua`
- Custom zettelkasten module in `nvim/lua/zettelkasten/` for secondbrain note-taking

Key plugins: telescope (with multigrep), harpoon, oil, treesitter, LSP, mini.nvim, gitsigns

Notable keybindings:
- `-` opens Oil file browser
- `<Space><Space>x` sources current file
- `<Space>x` executes current line as Lua
- `<Space>to` opens terminal split
- `<Space>fd` find files, `<Space>fh` help tags, `<Space>en` edit nvim config
- `<leader>lg` opens lazygit
- `<leader>sb` creates zettelkasten note from `[[title]]` under cursor
- `<leader>zo` opens zettelkasten link under cursor

### Shell Environment

Zsh with vi-mode, starship prompt, fzf integration. Key aliases:
- `v` → nvim
- `t` → tmux
- `g`, `gs`, `gp` → git shortcuts
- `k` → kubectl
- `lg` → lazygit
- `dot` → cd to dotfiles

Uses mise for runtime version management.

### Tmux

Vi mode for copy, mouse enabled, status bar shows `pomo` timer. Reload config with `prefix + r`.

### Window Management (macOS)

Aerospace tiling window manager with vim-style navigation:
- `alt-hjkl` for focus
- `alt-shift-hjkl` for moving windows
- `alt-1..9` for workspaces
