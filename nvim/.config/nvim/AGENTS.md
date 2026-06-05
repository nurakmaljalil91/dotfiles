# AGENTS.md

Guidance for coding agents working in this Neovim configuration.

## Project Overview

This is a modular Neovim configuration based on `kickstart.nvim`, optimized for C++ and CMake development. The entry point is `init.lua`, which loads core settings, bootstraps `lazy.nvim`, and imports plugin specs from `lua/custom/plugins/`.

Load order:

1. `init.lua`
2. `lua/core/options.lua`
3. `lua/core/keymaps.lua`
4. `lua/core/autocmds.lua`
5. `lazy.nvim`
6. `lua/custom/plugins/*.lua`

## Repository Layout

- `init.lua`: Neovim entry point and `lazy.nvim` bootstrap.
- `lua/core/`: Native editor options, keymaps, and autocmds.
- `lua/custom/plugins/`: Active plugin specs. Add new plugins here.
- `lua/kickstart/plugins/`: Original Kickstart reference modules, mostly superseded by `lua/custom/plugins/`.
- `doc/`: Local Neovim configuration notes and cheatsheets.

## Editing Guidelines

- Prefer the existing modular structure. Keep plugin configuration in a dedicated file under `lua/custom/plugins/` when practical.
- Each active plugin file should return a `lazy.nvim` spec or a list of specs.
- Do not register new plugin files manually; `init.lua` imports `custom.plugins` as a directory.
- Keep core Neovim behavior in `lua/core/`, not in plugin specs, unless it depends directly on a plugin.
- Avoid broad refactors unless the user explicitly asks for them.

## Formatting

Lua formatting is controlled by `.stylua.toml`:

- 2-space indentation
- 160 column width
- single quotes preferred
- no parentheses for standalone function calls

Use `stylua` for Lua formatting when available.

## Key System Assumptions

- Neovim 0.10+ is expected.
- `lazy.nvim` is bootstrapped automatically on first launch.
- A Nerd Font is expected for icons.
- Yazi is required for the configured file manager integration.
- CMake and LLVM/Clang tooling are expected for C++ workflows.

## C++ and CMake Notes

- `clangd` is the primary LSP.
- `clangd` expects compile commands from `build/`.
- `cmake-tools.nvim` is configured to use `./build` and generate `compile_commands.json`.
- C and C++ formatting is intentionally not handled by `conform.nvim` unless that behavior is changed explicitly.

## Validation

Useful checks after edits:

- `nvim --headless "+Lazy! sync" +qa` to validate plugin resolution when network and UI constraints allow it.
- `nvim --headless "+checkhealth" +qa` for broader Neovim health diagnostics.
- `stylua <files>` for Lua formatting.

Do not assume these commands are safe to run in every environment; they may install plugins, require network access, or depend on local binaries.
