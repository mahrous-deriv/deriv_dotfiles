# Neovim Configuration

This repository contains a modular Neovim configuration written in Lua.

## Directory Structure
- `lua/init.lua` - Core Neovim settings.
- `lua/mappings.lua` - Key mappings.
- `lua/plugins.lua` - Plugin management.
- `lua/themes.lua` - Theme configurations.

## Key Mappings

### Plugin-Specific Mappings
- **NERDTree**:
  - `<leader>n` - Focus NERDTree.
  - `<C-t>` - Toggle NERDTree.
  - `<C-f>` - Find file in NERDTree.
- **EasyAlign**:
  - `ga` - Align selection or motion.
- **Multiple Cursors**:
  - `<C-m>` - Select next occurrence.
  - `<C-p>` - Select previous occurrence.
  - `<C-x>` - Skip occurrence.
  - `<Esc>` - Quit multiple cursors mode.
- **Fugitive Git**:
  - `<leader>gaa` - Git add all.
  - `<leader>gc` - Git commit.
  - `<leader>gp` - Git push.
  - `<leader>gl` - Git pull.
  - `<leader>gb` - Git blame.
  - `<leader>gst` - Git status.
  - `<leader>gd` - Git diff.
  - `<leader>glg` - Git log.
- **EasyMotion**:
  - `<Leader><leader>h` - Line backward.
  - `<Leader><Leader>j` - Move down.
  - `<Leader><Leader>k` - Move up.
  - `<Leader><leader>l` - Line forward.
  - `<Leader><leader>.` - Repeat motion.
- **Tagbar**:
  - `<leader>tb` - Toggle Tagbar.
### General
- `<leader>w` - Save file.
- `<leader>q` - Format paragraph.
- `<leader>l` - Toggle list mode.
- `<leader>bd` - Close buffer.

### AI Plugins
- `<leader>cg` - New AI Chat.
- `<leader>ca` - Append AI Suggestion.
- `<leader>cr` - Rewrite with AI.
- `<leader>cp` - AI Popup.

## Themes
- `gruvbox`
- `iceberg`
- `onedark`

## Installation
1. Install Neovim.
2. Clone this repository into `~/.config/nvim`.
3. Open Neovim and run `:LazySync` to install plugins.

## Notes
- Ensure `OPENAI_API_KEY` is set for AI features.
- Modify `lua/mappings.lua` to customize key bindings.
- Themes are applied automatically after plugins are loaded.
