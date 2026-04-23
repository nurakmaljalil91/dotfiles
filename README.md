# My Linux Configurations

## Install Stow

```bash
sudo apt update
sudo apt install stow
```

- Verify installations

```bash
stow --version
```

## Move all the configurations

```bash
mkdir ~/.configurations
cd ~/.configurations

# Create folders named after the 'packages' you want to manage
mkdir -p nvim/.config
mkdir -p tmux
mkdir -p zsh
mkdir -p wezterm
mkdir -p conky/.config
mkdir -p eww/.config

# Move your actual configs into these folders
# Note: Keep the internal structure identical to your home folder
mv ~/.config/nvim nvim/.config/
mv ~/.tmux.conf tmux/
mv ~/.zshrc zsh/
mv ~/.wezterm.lua wezterm/
mv ~/.config/conky conky/.config/
mv ~/.config/eww eww/.config
```

## Initialize the repo

```bash
chmod +x init.sh
./init.sh
```

This writes `~/.stowrc` with the correct target and stows every top-level package in this repository.

## Stow your configurations manually

```bash
stow nvim
stow tmux
stow zsh
stow wezterm
stow conky
stow eww
```
## Some commands

- `stow *` : Add everything (run on top level folder)
- `stow -D nvim` : Remove link
- `stow -R nvim` : Refresh link
- `stow -nv nvim` : Simulate a dry run

## Tips

- Create a file named `~/.stowrc` and add `--target=$HOME` to ensure Stow always targets your home directory
