-- ==========================================================================
-- Neovim Plugin-Specific Key Mappings
-- ==========================================================================

-- AI Plugin Mappings
vim.keymap.set("n", "<leader>cg", ":GpChatNew<CR>", { desc = "New AI Chat" })
vim.keymap.set("v", "<leader>cg", ":'<,'>GpChatNew<CR>", { desc = "New AI Chat (Visual)" })
vim.keymap.set("n", "<leader>ca", ":GpAppend<CR>", { desc = "Append AI Suggestion" })
vim.keymap.set("n", "<leader>cr", ":GpRewrite<CR>", { desc = "Rewrite with AI" })
vim.keymap.set("n", "<leader>cp", ":GpPopup<CR>", { desc = "AI Popup" })

-- NERDTree Mappings
vim.keymap.set("n", "<leader>n", ":NERDTreeFocus<CR>", { desc = "Focus NERDTree" })
vim.keymap.set("n", "<C-t>", ":NERDTreeToggle<CR>", { desc = "Toggle NERDTree" })
vim.keymap.set("n", "<C-f>", ":NERDTreeFind<CR>", { desc = "Find File in NERDTree" })

-- EasyAlign Mappings
vim.keymap.set("x", "ga", "<Plug>(EasyAlign)", { desc = "Align Selection" })
vim.keymap.set("n", "ga", "<Plug>(EasyAlign)", { desc = "Align Motion" })

-- Multiple Cursors Mappings
vim.g.multi_cursor_next_key = "<C-m>"
vim.g.multi_cursor_prev_key = "<C-p>"
vim.g.multi_cursor_skip_key = "<C-x>"
vim.g.multi_cursor_quit_key = "<Esc>"

-- Fugitive Git Mappings
vim.keymap.set("n", "<leader>gaa", ":Git add .<CR>", { desc = "Git Add All" })
vim.keymap.set("n", "<leader>gc", ":Gcommit<CR>", { desc = "Git Commit" })
vim.keymap.set("n", "<leader>gp", ":Gpush<CR>", { desc = "Git Push" })
vim.keymap.set("n", "<leader>gl", ":Gpull<CR>", { desc = "Git Pull" })
vim.keymap.set("n", "<leader>gb", ":Gblame<CR>", { desc = "Git Blame" })
vim.keymap.set("n", "<leader>gst", ":Gstatus<CR>", { desc = "Git Status" })
vim.keymap.set("n", "<leader>gd", ":Gdiff<CR>", { desc = "Git Diff" })
vim.keymap.set("n", "<leader>glg", ":Glog<CR>", { desc = "Git Log" })

-- EasyMotion Mappings
vim.keymap.set("n", "<Leader><leader>h", "<Plug>(easymotion-linebackward)", { desc = "EasyMotion Line Backward" })
vim.keymap.set("n", "<Leader><Leader>j", "<Plug>(easymotion-j)", { desc = "EasyMotion Down" })
vim.keymap.set("n", "<Leader><Leader>k", "<Plug>(easymotion-k)", { desc = "EasyMotion Up" })
vim.keymap.set("n", "<Leader><leader>l", "<Plug>(easymotion-lineforward)", { desc = "EasyMotion Line Forward" })
vim.keymap.set("n", "<Leader><leader>.", "<Plug>(easymotion-repeat)", { desc = "EasyMotion Repeat" })

-- Syntastic Settings
vim.g.syntastic_check_on_wq = 1
vim.g.syntastic_auto_jump = 1

-- Tagbar Mapping
vim.keymap.set("n", "<leader>tb", ":TagbarToggle<CR>", { desc = "Toggle Tagbar" })

-- ==========================================================================
-- End of Plugin-Specific Key Mappings
-- ==========================================================================
