# 🧭 Neovim Keymaps Documentation

This document explains the key mappings defined in your Neovim configuration file.
The mappings aim to improve workflow efficiency for file management, navigation, and diagnostics.

---

## ⚙️ Leader Keys

```lua
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
```

- **Global Leader**: `Space`
- **Local Leader**: `Space`

These are used as prefixes for custom keybindings.

---

## 🚫 Disable Spacebar in Normal & Visual Mode

```lua
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
```

Prevents the spacebar from triggering any default behavior in Normal or Visual modes.

---

## ⚡ Common Options

```lua
local opts = { noremap = true, silent = true }
```

- **noremap**: Prevents recursive mappings
- **silent**: Suppresses command output in the command line

---

## 💾 File Management

| Action                     | Mode   | Key          | Command        |
| -------------------------- | ------ | ------------ | -------------- |
| Save file                  | Normal | `<C-s>`      | `:w`           |
| Save file (no auto-format) | Normal | `<leader>sn` | `:noautocmd w` |
| Quit file                  | Normal | `<C-q>`      | `:q`           |

---

## ✂️ Editing

| Action                       | Key | Description                                     |
| ---------------------------- | --- | ----------------------------------------------- |
| Delete single char (no copy) | `x` | Deletes a character without affecting registers |

---

## 🧭 Navigation Enhancements

| Action                            | Key     | Description                                    |
| --------------------------------- | ------- | ---------------------------------------------- |
| Scroll down (centered)            | `<C-d>` | Scrolls half-page down and centers cursor      |
| Scroll up (centered)              | `<C-u>` | Scrolls half-page up and centers cursor        |
| Next search result (centered)     | `n`     | Moves to next search result and centers it     |
| Previous search result (centered) | `N`     | Moves to previous search result and centers it |

---

## 📏 Window Resizing

| Action       | Key       | Description     |
| ------------ | --------- | --------------- |
| Resize up    | `<Up>`    | Decrease height |
| Resize down  | `<Down>`  | Increase height |
| Resize left  | `<Left>`  | Decrease width  |
| Resize right | `<Right>` | Increase width  |

---

## 🧩 Buffer Management

| Action          | Key         | Command      | Description               |
| --------------- | ----------- | ------------ | ------------------------- |
| Next buffer     | `<Tab>`     | `:bnext`     | Switch to next buffer     |
| Previous buffer | `<S-Tab>`   | `:bprevious` | Switch to previous buffer |
| Close buffer    | `<leader>x` | `:bdelete!`  | Close current buffer      |
| New buffer      | `<leader>b` | `:enew`      | Create a new buffer       |

---

## 🪟 Window Management

| Action             | Key          | Command  | Description            |
| ------------------ | ------------ | -------- | ---------------------- |
| Split vertically   | `<leader>v`  | `<C-w>v` | Vertical split         |
| Split horizontally | `<leader>h`  | `<C-w>s` | Horizontal split       |
| Equalize splits    | `<leader>se` | `<C-w>=` | Make splits equal size |
| Close split        | `<leader>xs` | `:close` | Close current split    |

### Move Between Splits

| Key     | Action              |
| ------- | ------------------- |
| `<C-h>` | Move to left split  |
| `<C-j>` | Move to below split |
| `<C-k>` | Move to above split |
| `<C-l>` | Move to right split |

---

## 🗂️ Tab Management

| Action            | Key          | Command     |
| ----------------- | ------------ | ----------- |
| Open new tab      | `<leader>to` | `:tabnew`   |
| Close current tab | `<leader>tx` | `:tabclose` |
| Next tab          | `<leader>tn` | `:tabn`     |
| Previous tab      | `<leader>tp` | `:tabp`     |

---

## 🔡 Miscellaneous

| Action                         | Key                 | Description                           |
| ------------------------------ | ------------------- | ------------------------------------- |
| Toggle line wrap               | `<leader>lw`        | Toggles line wrapping                 |
| Stay in indent mode            | `<` / `>` in Visual | Keeps selection active when indenting |
| Paste without losing last yank | `p` in Visual       | Preserves previous yank content       |

---

## 🚨 LSP Diagnostics

| Action                  | Key         | Description                       |
| ----------------------- | ----------- | --------------------------------- |
| Previous diagnostic     | `[d`        | Jump to previous diagnostic       |
| Next diagnostic         | `]d`        | Jump to next diagnostic           |
| Show diagnostic (float) | `<leader>d` | Open floating diagnostic window   |
| Show diagnostics list   | `<leader>q` | Open diagnostics in location list |

---

### 🧩 Example File Location

You can place this file in:

```
~/.config/nvim/lua/keymaps.lua
```

And source it in your main `init.lua`:

```lua
require('keymaps')
```
