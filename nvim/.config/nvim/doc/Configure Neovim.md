# Neovim Configuration Structure (Modularized Kickstart)

This document describes the modular structure of my Neovim configuration, based on `kickstart.nvim`.

## Directory Structure

```
~/.config/nvim/
├── init.lua                # Entry point (bootstraps lazy.nvim and core modules)
├── Configure Neovim.md     # This documentation file
└── lua/
    ├── core/               # Native Neovim configurations
    │   ├── options.lua     # General editor options (line numbers, tabs, etc.)
    │   ├── keymaps.lua     # General keybindings (window navigation, search clearing)
    │   └── autocmds.lua    # Automatic behavior (highlight on yank, etc.)
    └── custom/
        └── plugins/        # Individual plugin configurations
            ├── theme.lua
            ├── treesitter.lua
            ├── lsp.lua
            └── ... (one file per major plugin)
```

## Core Settings
- **Options**: Found in `lua/core/options.lua`. This is where you change things like `relativenumber`, `tabstop`, or `mapleader`.
- **Keymaps**: Found in `lua/core/keymaps.lua`. These are non-plugin specific shortcuts.
- **Autocmds**: Found in `lua/core/autocmds.lua`.

## Installed Plugins & Features

| Plugin | Purpose |
| :--- | :--- |
| **Theme** (`theme.lua`) | Uses `vscode.nvim` to provide a dark, VS Code-like aesthetic. |
| **LSP** (`lsp.lua`) | Configures `nvim-lspconfig`, `mason`, and `fidget` for IDE-like features (Go to definition, Rename, etc.). |
| **Treesitter** (`treesitter.lua`) | Advanced syntax highlighting and code understanding. |
| **Telescope** (`telescope.lua`) | Highly extensible fuzzy finder for files, text, LSP symbols, and more. |
| **Blink.cmp** (`blink.lua`) | Modern, fast autocompletion engine with snippet support via `LuaSnip`. |
| **Copilot** (`copilot.lua`) | Configures `zbirenbaum/copilot.lua` to provide GitHub Copilot AI code suggestions inside Neovim. |
| **Conform** (`conform.lua`) | Lightweight formatter plugin (e.g., `stylua` for Lua, `prettier` for JSON). |
| **Neo-tree** (`neo-tree.lua`) | A full-featured file explorer sidebar (Toggle with `<leader>e`). |
| **Gitsigns** (`gitsigns.lua`) | Shows git changes in the gutter (additions, deletions, etc.). |
| **Which-key** (`which-key.lua`) | Displays a popup with available keybindings as you type. |
| **Mini.nvim** (`mini.lua`) | A collection of small utilities for text objects (`mini.ai`), surroundings (`mini.surround`), and a clean statusline. |
| **Render-markdown** (`render-markdown.lua`) | Improves the visual appearance of Markdown files inside Neovim. |
| **Todo-comments** (`todo-comments.lua`) | Highlighting and searching for `TODO`, `FIXME`, `NOTE`, etc. in your code. |
| **Guess-indent** (`guess-indent.lua`) | Automatically detects and sets indentation (tabs vs spaces) based on the current file. |
| **Yazi** (`yazi.lua`) | Integrates the Yazi terminal file manager into Neovim via floating windows. |
| **CMake Tools** (`cmake.lua`) | Advanced management for CMake projects (Configure, Build, Run). |
| **DAP** (`dap.lua`) | Debug Adapter Protocol support for C++ using `codelldb`. |

## Adding New Plugins
To add a new plugin:
1. Create a new file in `lua/custom/plugins/plugin-name.lua`.
2. Return a Lua table containing the plugin specification (the same way `lazy.nvim` expects it).
   Example:
   ```lua
   return {
     "username/repo",
     opts = {},
   }
   ```
3. `lazy.nvim` is configured to automatically import everything from this directory.

## Managing Existing Plugins
Modify the corresponding file in `lua/custom/plugins/` to change settings or add keymaps specific to that plugin.
