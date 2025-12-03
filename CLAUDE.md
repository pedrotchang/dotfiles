# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles repository for macOS, Linux, WSL2, and Omarchy. Configuration files are symlinked to their target locations using the `setup` script, which auto-detects the platform.

## Setup

```bash
./setup
```

Platform detection order in `setup`:
1. macOS (`darwin`)
2. WSL2 (checks `/proc/version` for "microsoft")
3. Omarchy (checks for `~/.local/share/omarchy`)
4. Native Linux

### Symlink Mappings

**Common (all platforms):**
- `nvim/` → `~/.config/nvim`
- `k9s/skin.yml` → `~/.config/k9s/skin.yml`
- `eza/theme.yml` → `~/.config/eza/eza.yml`
- `.tmux.conf` → `~/.tmux.conf`
- `.zshrc`, `.zprofile` → home directory

**macOS:** Aerospace, Karabiner, Ghostty (uses `ghostty/config.macos`)

**Linux:** Ghostty (uses `ghostty/config.linux`)

**WSL2:** Links Windows Alacritty config from `%APPDATA%/alacritty/`

**Omarchy:** Copies `hypr/custom.conf` (not symlinked), backs up Omarchy's nvim to `nvim.omarchy-backup`

## Architecture

### Neovim Configuration (`nvim/`)

Entry point: `nvim/init.lua` → loads `config/lazy.lua` and `zettelkasten/zettelkasten.lua`

**Plugin system:**
- lazy.nvim bootstrapped in `nvim/lua/config/lazy.lua`
- Plugins in `nvim/lua/config/plugins/*.lua` (auto-imported via `{ import = "config.plugins" }`)
- Leader: `<Space>`, Local leader: `\`
- Colorscheme: everforest (hard background)

**Custom modules:**
- `nvim/lua/zettelkasten/zettelkasten.lua` - Creates notes via `sb` CLI tool (note: hardcoded macOS path `/Users/seyza/.asdf/shims/sb`)
- `nvim/lua/config/telescope/multigrep.lua` - Custom telescope picker

**Key mappings (defined in init.lua):**
- `-` Oil file browser
- `<Space><Space>x` source current file, `<Space>x` execute line as Lua
- `<Space>to` terminal split, `<Space>te` set command, `<Space>tr` run command
- `<leader>lg` lazygit
- `<leader>sb` create zettelkasten note, `<leader>zo` open zettelkasten link

### Shell Environment

The `.zshrc` loads Omarchy-zsh configs when on Omarchy, otherwise is minimal. Shell customizations are platform-specific via the sourced configs.

`.zprofile` sets up Homebrew (macOS) and `XDG_CONFIG_HOME`.

### Tmux

Vi mode for copy, mouse enabled, status bar shows `pomo` timer. Reload: `prefix + r`.

### Window Management

**macOS (Aerospace):** `alt-hjkl` focus, `alt-shift-hjkl` move, `alt-1..9` workspaces

**Omarchy (Hyprland):** `Super+HJKL` focus, `Super+Shift+HJKL` swap, `Super+Alt+HJKL` resize. No borders/gaps.
