return {
    {
        "github/copilot.vim",
        config = function()
            vim.g.copilot_no_tab_map = false
            vim.g.copilot_workspace_folders = { vim.fn.getcwd() }
        end,
    },
    {
        "robitx/gp.nvim",
        name = "gp",
        event = "BufEnter",
        config = function()
            local openai_api_key = vim.fn.getenv("OPENAI_API_KEY")
            if openai_api_key == nil or openai_api_key == "" then
                vim.api.nvim_err_writeln("WARNING: OPENAI_API_KEY is not set!")
            end
            require("gp").setup({
                log_file = vim.fn.stdpath("log"):gsub("/$", "") .. "/gp.nvim.log",
                log_sensitive = false,
                providers = {
                    openai = {
                        endpoint = "https://api.openai.com/v1/chat/completions",
                        secret = openai_api_key,
                        model = "gpt-3.5-turbo",
                        debug = true,
                    },
                },
                whisper = {
                    disable = false,
                    endpoint = "https://api.openai.com/v1/audio/transcriptions",
                    store_dir = (os.getenv("TMPDIR") or os.getenv("TEMP") or "/tmp") .. "/gp_whisper",
                    silence = "1.75",
                    tempo = "1.75",
                    language = "en",
                    rec_cmd = nil,
                },
            })
        end,
    },
}
