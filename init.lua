-- guide
-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/

-- install lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  'folke/tokyonight.nvim',
  'nvim-tree/nvim-tree.lua',
  'neovim/nvim-lspconfig',
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  'nvim-lua/plenary.nvim',
  { 'nvim-telescope/telescope.nvim', 
     tag = '0.1.5',
     dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			--extensions_list = { "fzf" }
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
})
  

-- required vim options before plugins
vim.g.mapleader = ' '

local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

require'lspconfig'.tsserver.setup{
    on_attach = on_attach
}

require'lspconfig'.html.setup{
    on_attach = on_attach
}

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>NvimTreeFindFileToggle<CR>', { noremap = true })


-- vim options
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false -- transform a tab to space
vim.opt.swapfile = false
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>') -- select all text in current buffer

-- delete but keep register text
vim.keymap.set({'n', 'x'}, 'x', '"_x')
vim.keymap.set({'n', 'x'}, 'X', '"_d')

-- theme
vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')
