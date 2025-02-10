return {
    { "tpope/vim-fugitive" },
    { "gregsexton/gitv" },
    { "airblade/vim-gitgutter" },
    { "lewis6991/gitsigns.nvim", config = function()
        require("gitsigns").setup({
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
            numhl = false,
            linehl = false,
            watch_gitdir = {
                interval = 1000,
                follow_files = true,
            },
            attach_to_untracked = true,
            current_line_blame = false,
            sign_priority = 6,
            update_debounce = 200,
            status_formatter = nil,
            max_file_length = 40000,
        })
    end }
}

