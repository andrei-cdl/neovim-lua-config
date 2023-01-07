-- navigate windows with just ctrl+<direction>
vim.api.nvim_set_keymap('n', '<C-h>', "<C-w>h", { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<C-j>', "<C-w>j", { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<C-k>', "<C-w>k", { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<C-l>', "<C-w>l", { noremap = true, silent = true });

-- fugitive 3 way merge and list
vim.api.nvim_set_keymap('n', '<leader>gf', ":diffget //2<CR>", { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<leader>gh', ":diffget //3<CR>", { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<leader>gs', ":G<CR>", { noremap = true, silent = true });

-- tree toggle file explorer
vim.api.nvim_set_keymap('n', '<C-n>', ":NvimTreeToggle<CR>", { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<C-m>', ":NvimTreeFindFile<CR>", { noremap = true, silent = true });

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", {silent = true, noremap = true})

vim.keymap.set("n", "<cr>", "", {silent = true, noremap = true})

-- vim.keymap.set("n", "C-SpaceC-Space", ":Telescope buffersCR")
-- vim.keymap.set("n", "C-SpaceC-g", ":Telescope live_grepCR")
-- vim.keymap.set("n", "C-SpaceC-f", ":Telescope find_filesCR")
vim.keymap.set("n", "gt", ":Telescope diagnosticsCR")
vim.keymap.set("n", "gd", ":Telescope lsp_definitionsCR")
