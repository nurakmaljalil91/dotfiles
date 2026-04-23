# AGENTS.md

Guidance for coding agents working in this dotfiles repository.

## Project Overview

This repository manages home directory configuration with GNU Stow. Each top-level directory is a Stow package whose internal layout mirrors the target path under `$HOME`. Running `stow <package>` from the repository root creates symlinks into the home directory.

Current packages:

- `nvim/` -> `~/.config/nvim/`
- `tmux/` -> `~/.tmux.conf`
- `zsh/` -> `~/.zshrc`
- `wezterm/` -> `~/.wezterm.lua`
- `conky/` -> `~/.config/conky/`

## Repository Layout

- `init.sh`: Bootstrap script that writes `~/.stowrc` and stows all top-level packages.
- `README.md`: User-facing setup instructions.
- `CLAUDE.md`: Existing repository guidance with the same Stow model.
- `<package>/`: A Stow package. Keep the directory contents shaped like the destination path in `$HOME`.

If you work inside `nvim/.config/nvim/`, also follow [nvim/.config/nvim/AGENTS.md](/home/amal/.configurations/nvim/.config/nvim/AGENTS.md).

## Editing Guidelines

- Preserve the Stow package model. Do not flatten package contents or move files out of their home-relative paths.
- When adding a new tool, create a new top-level package directory and reproduce the target path structure inside it.
- Keep changes scoped to the package the user asked to modify. Do not refactor unrelated dotfiles.
- Treat symlink targets as user environment state. Prefer editing files in this repository rather than touching files directly under `$HOME`.
- Avoid embedding machine-specific paths, usernames, or host-only assumptions unless the repository already depends on them intentionally.

## Stow Workflow

Useful commands from the repository root:

```bash
./init.sh
stow -nv <package>
stow <package>
stow -R <package>
stow -D <package>
```

`stow -nv <package>` is the safest first check because it previews symlink changes without mutating the home directory.

## Validation

After editing a package, prefer validation proportional to the change:

- For Stow structure changes, run `stow -nv <package>` from the repository root.
- For shell config changes, use `zsh -n zsh/.zshrc` when the edit is limited to shell syntax.
- For tmux config changes, use `tmux -f tmux/.tmux.conf start-server` if tmux is available and the command is safe in the environment.
- For WezTerm and Conky changes, rely on syntax-aware checks only if the relevant binaries are installed locally.
- For Neovim changes, use the checks described in `nvim/.config/nvim/AGENTS.md`.

Do not run commands that mutate the real home directory or depend on unavailable GUI/system services unless the user asked for that explicitly.
