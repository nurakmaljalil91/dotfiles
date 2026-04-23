# My Linux Configurations

## Install Stow

```bash
sudo apt update
sudo apt isntall stow
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

# Move your actual configs into these folders
# Note: Keep the internal structure identical to your home folder
mv ~/.config/nvim nvim/.config/
mv ~/.tmux.conf tmux/
mv ~/.zshrc zsh/
mv ~/.wezterm.lua wezterm/
```
- Stow your configurations

```bash
stow nvim
stow tmux
stow zsh
stow wezterm
```
## Some commands

- `stow *` : Add everything (run on top level folder)
- `stow -D nvim` : Remove link
- `stow -R nvim` : Refresh link
- `stow -nv nvim` : Stimulate dry run

## Tips

- Create  a file named claeed `~/.stowrc` and add `--target=$HOME` to ensure stow always target home directory

