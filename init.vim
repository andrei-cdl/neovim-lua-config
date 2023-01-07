call plug#begin()
" Editting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" colorscheme
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/edge'

" Git
Plug 'tpope/vim-fugitive'

" navigation
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

Plug 'sunjon/shade.nvim'

" easily share github links, show changes
Plug 'ruifm/gitlinker.nvim'
Plug 'lewis6991/gitsigns.nvim'

" Workspace issues view / quickfix view
Plug 'folke/trouble.nvim'

" comment toggler
Plug 'terrortylor/nvim-comment'

" tmux movement
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" TODO: move to lua files
syntax on;

if has('termguicolors')
  set termguicolors
endif

" The configuration options should be placed before `colorscheme edge`.
let g:edge_style = 'neon'
let g:edge_better_performance = 1

colorscheme gruvbox-material

" setup copy to standard clipboard
vmap <leader>y "+y
let mapleader = "\<Space>"

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" General vim config
set number
set noswapfile
set hidden
set encoding=UTF-8
set cursorline
set scrolloff=10
set colorcolumn=120
set ttimeoutlen=5

" tab indentation
set sts=2
set ts=2
set sw=2

" comment this to use tabs instead of spaces > set expandtab
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list

" required for lsp auto complete
set completeopt=menu,menuone,noselect

" Load lua plugins and configuration
:lua require('lsp_config')
:lua require('telescope_config')
:lua require('shade_config')
:lua require('nvimtree_config')
:lua require('gitlinker_config')
:lua require('git_config')
:lua require('trouble_config')
:lua require('comment_config')
:lua require('init_config')
