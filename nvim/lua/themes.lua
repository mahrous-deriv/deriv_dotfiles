-- ==========================================================================
-- Neovim Theme Configuration (Lua Migration)
-- ==========================================================================

-- Function to set up Gruvbox theme
local function setup_gruvbox()
    vim.g.gruvbox_italics = 1
    vim.g.gruvbox_contrast_dark = "hard"
    vim.g.gruvbox_bold = 1
    vim.g.gruvbox_underline = 1

    vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "gruvbox",
        command = "hi Comment cterm=italic gui=italic | hi CursorLine ctermbg=236 guibg=#3c3836 | hi NormalNC ctermbg=235 guibg=#282828",
    })

    if vim.fn.has("termguicolors") == 1 then
        vim.opt.termguicolors = true
        vim.cmd("hi LineNr ctermbg=NONE guibg=NONE")
    end

    vim.cmd("colorscheme gruvbox")
end

-- Function to set up Iceberg theme
local function setup_iceberg()
    vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "iceberg",
        command = "hi LineNr ctermfg=lightblue guifg=#6c8d9b | hi CursorLine ctermbg=235 guibg=#1c1f26 | hi Search ctermfg=black ctermbg=lightblue guifg=#1b2b34 guibg=#c0c5ce | hi MatchParen ctermbg=238 guibg=#4f5b66 | hi NormalNC ctermbg=236 guibg=#2b303b",
    })

    if vim.fn.has("termguicolors") == 1 then
        vim.opt.termguicolors = true
        vim.cmd("hi LineNr ctermbg=NONE guibg=NONE")
    end

    vim.cmd("colorscheme iceberg")
end

-- Function to set up OneDark theme
local function setup_onedark()
    vim.g.onedark_hide_endofbuffer = 1
    vim.g.onedark_terminal_italics = 1
    vim.g.onedark_termcolors = 256

    vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "onedark",
        command = "hi Comment cterm=italic gui=italic",
    })

    if vim.fn.has("termguicolors") == 1 then
        vim.opt.termguicolors = true
        vim.cmd("hi LineNr ctermbg=NONE guibg=NONE")
    end

    vim.cmd("colorscheme onedark")
end

-- Function to apply a theme
local function apply_theme(theme)
    if theme == "gruvbox" then
        setup_gruvbox()
    elseif theme == "iceberg" then
        setup_iceberg()
    elseif theme == "onedark" then
        setup_onedark()
    else
        print("Invalid theme: " .. theme)
    end
end

-- ==========================================================================
-- End of Neovim Theme Configuration
-- ==========================================================================
