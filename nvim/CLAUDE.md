# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

A modular Neovim configuration based on `kickstart.nvim`, optimized for C++/CMake development. Plugin manager is `lazy.nvim`, which auto-imports all specs from `lua/custom/plugins/`.

## Architecture

**Load order**: `init.lua` → `lua/core/{options,keymaps,autocmds}.lua` → lazy.nvim → `lua/custom/plugins/*.lua`

**Two plugin layers**:
- `lua/kickstart/plugins/` — original kickstart modules (kept for reference, mostly superseded)
- `lua/custom/plugins/` — active plugin configs; each file returns a `LazySpec` table

Adding a plugin means creating a new file in `lua/custom/plugins/` that returns a lazy.nvim spec — no registration needed, the directory is imported wholesale.

## Key Plugin Responsibilities

| File | Plugin | Role |
|------|--------|------|
| `lsp.lua` | nvim-lspconfig + mason | LSP setup; `clangd` is primary with `--compile-commands-dir=build` |
| `cmake.lua` | cmake-tools.nvim | CMake configure/build/run; builds into `./build`, soft-links `compile_commands.json` to root |
| `dap.lua` | nvim-dap + codelldb | C++ debugging; DAP auto-opens/closes UI on session start/end |
| `conform.lua` | conform.nvim | Format-on-save for Lua (`stylua`); C/C++ intentionally excluded |
| `blink.lua` | blink.cmp | Completion engine with LuaSnip |
| `telescope.lua` | telescope.nvim | Fuzzy finder |

## Lua Formatting

Enforced by `stylua` via `.stylua.toml`: 2-space indent, 160 column width, single quotes preferred, no call parentheses on standalone calls.

Format Lua files with `<leader>f` (conform) or run `stylua <file>` from the shell.

## C++ / CMake Workflow

`clangd` looks for `compile_commands.json` in `./build`. `cmake-tools.nvim` generates it automatically via `-DCMAKE_EXPORT_COMPILE_COMMANDS=1` and soft-links it to the project root. The CMake build directory is always `build/`.

## Important Keymaps

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle Neo-tree |
| `<leader>-` | Open Yazi file manager |
| `<leader>f` | Format buffer |
| `<leader>b` / `<leader>B` | Toggle / conditional breakpoint |
| `<F5>` | Debug: start/continue |
| `<F1>/<F2>/<F3>` | Step into / over / out |
| `<F7>` | Toggle DAP UI |
| `<leader>th` | Toggle inlay hints |
| `grn` / `gra` / `grD` | LSP rename / code action / declaration |

## System Requirements

- Neovim 0.10+, Nerd Font, Yazi, CMake, LLVM/Clang (`clangd`, `codelldb`)
- Mason installs LSP servers automatically on first launch
