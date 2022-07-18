if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'cohama/lexima.vim'

if has("nvim")
 Plug 'neovim/nvim-lspconfig'
endif

Plug 'groenewege/vim-less', { 'for': 'less' }


call plug#end()

