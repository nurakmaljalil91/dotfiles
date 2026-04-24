# My Linux Configurations

## Install Stow

```bash
sudo apt update
sudo apt install stow
```

Verify:

```bash
stow --version
```

## Packages

| Directory | Symlink target | Notes |
|-----------|---------------|-------|
| `nvim/` | `~/.config/nvim/` | Full Neovim config |
| `tmux/` | `~/.tmux.conf` | Mouse support, scroll-to-copy-mode |
| `zsh/` | `~/.zshrc` | zsh-autosuggestions, fnm, oh-my-posh |
| `wezterm/` | `~/.wezterm.lua` | JetBrainsMono Nerd Font, Catppuccin Mocha |
| `conky/` | `~/.config/conky/` | Conky clock overlay |
| `eww/` | `~/.config/eww/`, `~/.config/autostart/` | eww clock widget, autostarts on login |

## Setup

Clone the repo and run the init script:

```bash
git clone <repo-url> ~/.configurations
cd ~/.configurations
chmod +x init.sh
./init.sh
```

This writes `~/.stowrc` with `--target=$HOME` and stows every top-level package automatically.

## Move existing configs into the repo

```bash
cd ~/.configurations

mkdir -p nvim/.config
mkdir -p tmux
mkdir -p zsh
mkdir -p wezterm
mkdir -p conky/.config
mkdir -p eww/.config/eww

mv ~/.config/nvim nvim/.config/
mv ~/.tmux.conf tmux/
mv ~/.zshrc zsh/
mv ~/.wezterm.lua wezterm/
mv ~/.config/conky conky/.config/
mv ~/.config/eww/* eww/.config/eww/
```

## Stow commands

```bash
stow nvim        # Apply a single package
stow *           # Apply all packages (run from ~/.configurations)
stow -D nvim     # Remove a package's symlinks
stow -R nvim     # Re-create symlinks (useful after moving files)
stow -nv nvim    # Dry run to preview changes
```

> **Note:** Stow may print `BUG in find_stowed_path` warnings related to Steam's absolute symlinks in `$HOME`. These are harmless and do not affect the stow operation.

## eww clock

The eww package includes a clock widget that displays on all connected monitors and autostarts on login via `~/.config/autostart/eww-clock.desktop`.

To start it manually:

```bash
~/.config/eww/launch.sh
```
