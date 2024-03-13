set autoindent
set backspace=eol,start,indent
set completeopt=menu,menuone,noselect
set et
set hidden
set history=400
set ignorecase
set incsearch
set nobackup
set nohlsearch
set noswapfile
set relativenumber
set shiftround
set signcolumn=number
set smartcase
set so=20
set sw=2
set termguicolors
set ts=2
set tw=80
set undolevels=1000
set wildmenu
set wrap

call plug#begin('~/.local/share/nvim/plugged')

Plug 'L3MON4D3/LuaSnip'
Plug 'LnL7/vim-nix'
Plug 'github/copilot.vim'
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-terraform'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'jesseleite/vim-agriculture'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'noah/vim256-color'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'peitalin/vim-jsx-typescript'
Plug 'ray-x/lsp_signature.nvim'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'sainnhe/sonokai'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vmchale/dhall-vim'

call plug#end()

" Delete trailing whitespace on write.
func! DeleteTrailingWhitespace()
  norm mz
  %s/\s\+$//ge
  norm `z
endfunc

autocmd BufWritePre * :call DeleteTrailingWhitespace()

set foldmethod=marker
set foldmarker={{{,}}}
nnoremap <leader>ss :set paste<CR>o-- {{{ -------------------------------------------------------------------------- }}} ------------------------------------------------------------------------<ESC>:set nopaste<CR>

map <Leader>e :edit ~/.config/nvim/init.vim<CR>
map <Leader>s :source ~/.config/nvim/init.vim<CR>

map <Leader>ff :GFiles<CR>
map <Leader>bb :Buffers<CR>

nmap <Leader>/ <Plug>RgRawSearch
nmap <Leader>* <Plug>RgRawWordUnderCursor<CR>

inoremap <C-c> <Esc>`^

color sonokai

lua <<EOLUA
  require('modules.cmp')
  require('modules.lsp')
  require('modules.treesitter')
EOLUA
