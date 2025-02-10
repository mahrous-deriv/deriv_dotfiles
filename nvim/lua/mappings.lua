-- ==========================================================================
-- Neovim Key Mappings (Lua Migration)
-- ==========================================================================

-- General Mappings
vim.keymap.set("n", "<leader>p", ":%w !lp<CR>", { silent = true, desc = "Print File" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit Insert Mode" })
vim.keymap.set("n", "/", "/\\v", { desc = "Enable Very Magic Search" })
vim.keymap.set("v", "/", "/\\v", { desc = "Enable Very Magic Search" })
vim.keymap.set("n", "<space>", ":", { desc = "Quick Command Mode" })
vim.keymap.set("n", "o", "o<esc>", { desc = "New Line Below" })
vim.keymap.set("n", "O", "O<esc>", { desc = "New Line Above" })
vim.keymap.set("n", "n", "nzz", { desc = "Center Search Result" })
vim.keymap.set("n", "N", "Nzz", { desc = "Center Search Result" })
vim.keymap.set("n", "Y", "y$", { desc = "Yank to End of Line" })

-- Window Navigation
vim.keymap.set("n", "<c-j>", "<c-w>j", { desc = "Move to Window Below" })
vim.keymap.set("n", "<c-k>", "<c-w>k", { desc = "Move to Window Above" })
vim.keymap.set("n", "<c-h>", "<c-w>h", { desc = "Move to Left Window" })
vim.keymap.set("n", "<c-l>", "<c-w>l", { desc = "Move to Right Window" })

-- Window Resizing
vim.keymap.set("n", "<c-up>", "<c-w>+", { desc = "Increase Window Height" })
vim.keymap.set("n", "<c-down>", "<c-w>-", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<c-left>", "<c-w>>", { desc = "Increase Window Width" })
vim.keymap.set("n", "<c-right>", "<c-w><", { desc = "Decrease Window Width" })

-- Buffer Navigation
vim.keymap.set("n", "<TAB>", ":bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>", { desc = "Previous Buffer" })

-- Tab Navigation
for i = 1, 9 do
    vim.keymap.set("n", "<leader>" .. i, i .. "gt", { desc = "Go to Tab " .. i })
end
vim.keymap.set("n", "<leader>0", ":tablast<CR>", { desc = "Go to Last Tab" })

-- Miscellaneous
vim.keymap.set("n", "<leader>/", ":nohls<CR>", { silent = true, desc = "Clear Search Highlight" })
vim.keymap.set("n", "<leader>sa", "ggvG$", { desc = "Select All" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save File" })
vim.keymap.set("n", "<leader>q", "gqip", { desc = "Format Paragraph" })
vim.keymap.set("n", "<leader>l", ":set list!<CR>", { desc = "Toggle List Mode" })
vim.keymap.set("c", "w!!", "w !sudo tee %", { desc = "Save as Root" })
vim.keymap.set("n", "<leader>bd", ":Bclose<CR>:tabclose<CR>gT", { desc = "Close Buffer" })

-- Relative Number Toggle
vim.opt.relativenumber = true
vim.api.nvim_create_autocmd("InsertLeave", { pattern = "*", command = "set relativenumber" })
vim.api.nvim_create_autocmd("InsertEnter", { pattern = "*", command = "set norelativenumber" })
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", command = "set cursorline" })
vim.api.nvim_create_autocmd("BufLeave", { pattern = "*", command = "set nocursorline" })

function NumberToggle()
    if vim.opt.relativenumber:get() then
        vim.opt.relativenumber = false
        vim.opt.number = true
    else
        vim.opt.relativenumber = true
    end
end

vim.keymap.set("n", "<C-n>", NumberToggle, { desc = "Toggle Relative Number" })

-- ==========================================================================
-- End of Neovim Key Mappings
-- ==========================================================================
