# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles repository for macOS, Linux, WSL2, and Omarchy, managed with [chezmoi](https://chezmoi.io/).

## Setup

```bash
# Install chezmoi and apply dotfiles
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply <github-username>

# Or if chezmoi is already installed
chezmoi init --apply <github-username>
```

## Common Commands

```bash
chezmoi apply          # Apply changes from source to home
chezmoi diff           # See what would change
chezmoi edit ~/.zshrc  # Edit a managed file
chezmoi add ~/.file    # Add a new file to management
chezmoi cd             # cd into source directory
```

## Platform Detection

Platform is auto-detected in `.chezmoi.toml.tmpl`:
1. macOS (`darwin`)
2. WSL2 (checks kernel for "microsoft")
3. Omarchy (checks for `~/.local/share/omarchy`)
4. Native Linux (fallback)

Access via `{{ .platform }}` in templates.

## File Structure

```
~/.local/share/chezmoi/
├── .chezmoi.toml.tmpl          # Platform detection config
├── .chezmoiignore.tmpl         # Platform-specific exclusions
├── dot_zshrc                   # → ~/.zshrc
├── dot_zprofile                # → ~/.zprofile
├── dot_tmux.conf               # → ~/.tmux.conf
├── dot_config/
│   ├── nvim/                   # Neovim config (all platforms)
│   ├── k9s/skin.yml            # k9s theme (all platforms)
│   ├── aerospace/              # macOS only (window manager)
│   ├── hypr/custom.conf        # Omarchy only (Hyprland)
│   └── waybar/                 # Omarchy only (status bar)
├── run_once_install-starship.sh.tmpl    # Installs starship prompt
├── run_once_setup-omarchy.sh.tmpl       # Omarchy-specific setup
└── run_once_setup-wsl.sh.tmpl           # WSL-specific setup
```

## Neovim Configuration (`dot_config/nvim/`)

Entry point: `init.lua` → loads `config/lazy.lua` and `zettelkasten/zettelkasten.lua`

**Plugin system:**
- lazy.nvim bootstrapped in `lua/config/lazy.lua`
- Plugins in `lua/config/plugins/*.lua` (auto-imported)
- Leader: `<Space>`, Local leader: `\`
- Colorscheme: everforest (hard background)

**Key mappings:**
- `-` Oil file browser
- `<Space><Space>x` source current file, `<Space>x` execute line as Lua
- `<Space>to` terminal split, `<Space>te` set command, `<Space>tr` run command
- `<leader>lg` lazygit
- `<leader>sb` create zettelkasten note, `<leader>zo` open zettelkasten link

## Platform-Specific Configs

**macOS:** Aerospace window manager

**Omarchy (Hyprland):** `Super+HJKL` focus, `Super+Shift+HJKL` swap, `Super+Alt+HJKL` resize. No borders/gaps.

**WSL2:** Symlinks Windows Alacritty config via run script
