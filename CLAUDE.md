# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

A dotfiles repository managed with GNU Stow. Each top-level directory is a Stow "package" whose internal layout mirrors the home directory structure. Running `stow <package>` from `~/.configurations` creates symlinks in `$HOME`.

## Packages

| Directory | Symlink target | Config file |
|-----------|---------------|-------------|
| `nvim/` | `~/.config/nvim/` | Full Neovim config (see `nvim/.config/nvim/CLAUDE.md`) |
| `tmux/` | `~/.tmux.conf` | Mouse support, scroll-to-copy-mode |
| `zsh/` | `~/.zshrc` | zsh-autosuggestions, fnm (Node), oh-my-posh (atomic theme) |
| `wezterm/` | `~/.wezterm.lua` | JetBrainsMono Nerd Font, Catppuccin Mocha, WebGpu renderer |

## Stow Workflow

```bash
# Apply a single package
stow nvim

# Apply all packages at once (run from ~/.configurations)
stow *

# Remove a package's symlinks
stow -D nvim

# Re-create symlinks (useful after moving files)
stow -R nvim

# Dry run to preview changes
stow -nv nvim
```

Create `~/.stowrc` with `--target=$HOME` so Stow always targets the home directory without needing to pass flags.

## Adding a New Package

1. Create a directory named after the tool (e.g., `git/`).
2. Reproduce the home-relative path inside it (e.g., `git/.gitconfig`).
3. Run `stow git` to link it.
