# My Modularized Neovim Configuration (Kickstart)

This is a professional, modularized Neovim configuration based on `kickstart.nvim`. It is optimized for C++, CMake, and high-productivity development.

## 🚀 Key Features

*   **Modular Architecture**: Clean separation between core settings (`lua/core/`) and individual plugin configurations (`lua/custom/plugins/`).
*   **Advanced C++ Development**:
    *   **LSP**: Powered by `clangd` for deep code intelligence.
    *   **CMake Integration**: `cmake-tools.nvim` for configuring, building, and running projects.
    *   **Debugging**: Integrated `nvim-dap` with `codelldb` and a professional UI.
*   **Modern File Management**:
    *   **Neo-tree**: Sidebar file explorer.
    *   **Yazi**: Blazing fast terminal file manager integrated via floating windows.
*   **Aesthetic UI**: Using `vscode.nvim` for a familiar, dark VS Code-like theme.

## 📁 Structure

```
~/.config/nvim/
├── init.lua                # Entry point (bootstraps lazy.nvim)
├── Configure Neovim.md     # Architectural documentation
├── Neovim CheatSheet.md    # Quick reference for keymaps
└── lua/
    ├── core/               # Native Neovim settings
    │   ├── options.lua     # Editor options
    │   ├── keymaps.lua     # General shortcuts
    │   └── autocmds.lua    # Automatic behaviors
    └── custom/
        └── plugins/        # Modular plugin specifications
```

## 🛠️ Requirements

- **Neovim 0.10+** (Recommended)
- **Nerd Font**: Required for icons.
- **Yazi**: Must be installed on your system for the Yazi integration.
- **CMake & LLVM/Clang**: For C++ intelligence and building.
- **tree-sitter CLI**: Required by the `nvim-treesitter` main branch to compile parsers. Install with `sudo pacman -S tree-sitter` on Arch/CachyOS. Update using command `:TSUpdate`.

## ⌨️ Quick Shortcuts

| Shortcut | Action |
| :--- | :--- |
| `<leader>e` | Toggle File Explorer (Neo-tree) |
| `<leader>-` | Open Yazi File Manager |
| `<F5>` | Start/Continue Debugging |
| `<leader>sf` | Search Files (Telescope) |
| `<leader>f` | Format Current Buffer |

---
*This configuration was refactored from the original kickstart.nvim into a modular setup for better maintainability.*
