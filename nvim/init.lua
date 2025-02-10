-- ==========================================================================
-- Neovim Configuration for Lua Migration
-- ==========================================================================

-- Load Key Mappings
require("mappings")

-- Load Lazy.nvim Configuration
require("config.lazy")

-- Load Plugin-Specific Mappings
require("plugin_mappings")

-- Load Theme Configurations
require("themes")

vim.cmd("colorscheme gruvbox")

vim.opt.mouse = "a" -- Enable mouse in all modes
vim.opt.number = true -- Display line numbers
vim.opt.cursorline = true -- Highlight current line
vim.opt.cursorcolumn = true -- Highlight current column
vim.opt.termguicolors = true -- Enable true colors

vim.opt.scrolloff = 8 -- Keep cursor centered
vim.opt.wrap = false -- Disable line wrapping
vim.opt.incsearch = true -- Incremental search
vim.opt.ignorecase = true -- Case-insensitive search
vim.opt.smartcase = true -- Case-sensitive if search includes uppercase
vim.opt.showmatch = true -- Show matching parenthesis
vim.opt.hlsearch = true -- Highlight search results
vim.opt.history = 1000 -- Save 1000 commands in history
vim.opt.wildmenu = true -- Enhanced command-line completion
vim.opt.wildmode = "list:longest" -- Completion behavior
vim.opt.wildignore = "*.docx,*.jpg,*.png,*.pdf,*.exe,*.flv,*.img" -- Ignore files in wildmenu
vim.opt.swapfile = false -- Disable .swp files
vim.opt.clipboard = "unnamed,unnamedplus" -- Enable clipboard copy/paste

-- Tab and Indentation Settings
vim.opt.shiftwidth = 4 -- Indentation level
vim.opt.tabstop = 4 -- Tab width
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.autoindent = true -- Enable auto-indenting
vim.opt.smarttab = true -- Enhanced tab behavior
vim.opt.smartindent = true -- Enable smart indentation
if vim.opt.modifiable:get() then
    vim.opt.formatoptions:remove("cro") -- Stop newline continuation of comments
end

-- Enhance User Experience
vim.opt.listchars = { tab = "▸ ", eol = "¬" } -- Visualize tabs and end-of-line characters
vim.opt.timeoutlen = 500 -- Set timeout length for mappings
vim.opt.updatetime = 300 -- Faster completion
vim.opt.cmdheight = 1 -- Additional command-line space
vim.opt.modelines = 0 -- Security setting
vim.opt.hidden = true -- Enable hidden buffers
vim.opt.encoding = "utf-8" -- Display encoding
vim.opt.fileencoding = "utf-8" -- File encoding
vim.opt.showtabline = 4 -- Always show tabline
vim.opt.visualbell = true -- Disable audible bell; use visual
vim.opt.ttyfast = true -- Enable faster rendering

-- Status Line Customization
vim.opt.showcmd = true -- Show partial command in status line
vim.opt.showmode = true -- Show mode on the status line
vim.opt.laststatus = 2 -- Always display status line
vim.opt.statusline = "%F %M %Y %R %= ascii: %b hex: 0x%B row: %l col: %c percent: %p%%"

-- File Type Handling
vim.cmd("filetype on") -- Enable filetype detection
vim.cmd("filetype plugin on") -- Enable filetype plugins
vim.cmd("filetype indent on") -- Enable filetype-based indentation

-- Cursor and Split Behavior
vim.opt.splitbelow = true -- Horizontal splits open below
vim.opt.splitright = true -- Vertical splits open to the right

-- Backup and Undo Settings
if vim.fn.has("nvim-0.5") == 1 then
    vim.opt.undodir = vim.fn.expand("~/.config/nvim/backup") -- Undo file directory
    vim.opt.undofile = true -- Persistent undo
    vim.opt.undoreload = 10000 -- Increase undo steps after file reload
end
vim.opt.backup = false -- Disable backup files

vim.g.tagbar_ctags_bin = "/usr/bin/ctags" -- Set ctags binary path

-- Auto Commands
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "init.lua",
    command = "source %",
})

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    command = [[if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif]],
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "perl" },
    command = "setlocal tabstop=4 shiftwidth=4 expandtab",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "bash", "python", "go", "lua", "rust", "js", "ts", "java", "c", "cpp" },
    command = "setlocal tabstop=4 shiftwidth=4 expandtab ai",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "yaml", "json", "css", "html"},
    command = "setlocal tabstop=2 shiftwidth=2",
})

vim.api.nvim_create_autocmd("WinLeave", {
    pattern = "*",
    command = "set nocursorline nocursorcolumn",
})

vim.api.nvim_create_autocmd("WinEnter", {
    pattern = "*",
    command = "set cursorline cursorcolumn",
})

-- ==========================================================================
-- End of Neovim Configuration
-- ==========================================================================
