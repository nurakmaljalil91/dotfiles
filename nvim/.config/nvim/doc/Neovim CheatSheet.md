# Neovim CheatSheet

This cheatsheet covers standard Vim motions and editing commands, along with custom keymaps specific to this configuration.

## 1. Navigation (Motions)

### Basic Movement
- `h`, `j`, `k`, `l`: Move Left, Down, Up, Right.
- `gj`, `gk`: Move Down/Up by visual lines (useful for wrapped text).

### Word Movement
- `w`: Jump forward to the start of the next word.
- `b`: Jump backward to the start of the word.
- `e`: Jump forward to the end of the word.
- `W`, `B`, `E`: Jump by "WORDS" (delimited by whitespace only).

### Line Movement
- `0`: Jump to the absolute start of the line.
- `^`: Jump to the first non-blank character of the line.
- `$`: Jump to the end of the line.
- `gg`: Jump to the start of the file.
- `G`: Jump to the end of the file.
- `{line}G`: Jump to a specific line number.

### Screen Movement
- `H`: Jump to Top of screen.
- `M`: Jump to Middle of screen.
- `L`: Jump to Bottom of screen.
- `zz`: Center the screen on the cursor.

## 2. Editing

### Modes
- `i`: Insert at cursor.
- `I`: Insert at the beginning of the line.
- `a`: Append after cursor.
- `A`: Append at the end of the line.
- `o`: Open a new line below and enter Insert mode.
- `O`: Open a new line above and enter Insert mode.
- `<Esc>` or `Ctrl-[`: Return to Normal mode.

### Changing & Deleting
- `x`: Delete character under cursor.
- `dw`: Delete word.
- `dd`: Delete entire line.
- `diw`: Delete "inside" word (doesn't include spaces).
- `daw`: Delete "around" word (includes spaces).
- `cw`: Change word (deletes word and enters Insert mode).
- `cc`: Change entire line.
- `C`: Change from cursor to the end of the line.
- `r`: Replace a single character.
- `R`: Enter Replace mode (overwrite text).

### Copy & Paste (Yank & Put)
- `y`: Yank (copy) selected text.
- `yy`: Yank entire line.
- `p`: Put (paste) after cursor.
- `P`: Put (paste) before cursor.

### Undo & Redo
- `u`: Undo.
- `Ctrl-r`: Redo.

## 3. Visual Mode (Selection)
- `v`: Character-wise visual mode.
- `V`: Line-wise visual mode.
- `Ctrl-v`: Block-wise visual mode.
- `gv`: Re-select the last visual selection.

## 4. Search & Replace
- `/pattern`: Search forward for a pattern.
- `?pattern`: Search backward for a pattern.
- `n`: Jump to next match.
- `N`: Jump to previous match.
- `:%s/old/new/g`: Replace all occurrences of `old` with `new` in the entire file.
- `:%s/old/new/gc`: Replace all with confirmation.

## 5. Custom Keymaps (This Config)

### General
- `<leader>f`: Format current buffer (Conform). Works for Lua (`stylua`) and JSON (`prettier`).
- `<Esc>` (Normal mode): Clear search highlights.
- `<leader>q`: Open diagnostic Quickfix list.

### Formatting JSON
- `<leader>f`: Format JSON with `prettier` (requires `:MasonInstall prettier`).
- `:%!jq .`: Pipe buffer through `jq` to pretty-print JSON (requires `jq` installed on system).

### Window Navigation
- `Ctrl-h`: Move focus to the left window.
- `Ctrl-j`: Move focus to the lower window.
- `Ctrl-k`: Move focus to the upper window.
- `Ctrl-l`: Move focus to the right window.

### File Explorers
- `<leader>e`: Toggle Neo-tree file explorer.
- `<leader>-`: Open Yazi at the current file.
- `<leader>cw`: Open Yazi in current working directory.

### Fuzzy Finder (Telescope)
- `<leader>sf`: Search Files.
- `<leader>sg`: Search by Grep (live).
- `<leader>sh`: Search Help.
- `<leader>sk`: Search Keymaps.
- `<leader>sw`: Search current Word.
- `<leader><leader>`: Find existing buffers.

### LSP (Language Server)
- `grr`: Go to References.
- `grd`: Go to Definition.
- `gri`: Go to Implementation.
- `grn`: Rename symbol.
- `gra`: Code Action.

### Debugging (DAP)
- `<F5>`: Start/Continue Debugging.
- `<F1>`: Step Into.
- `<F2>`: Step Over.
- `<F3>`: Step Out.
- `<leader>b`: Toggle Breakpoint.
- `<F7>`: Toggle Debugger UI.

## 6. Mini.Surround (Quick Guide)
- `saiw{char}`: Add surrounding `{char}` to word.
- `sd{char}`: Delete surrounding `{char}`.
- `sr{old}{new}`: Replace surrounding `{old}` with `{new}`.
