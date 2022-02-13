call plug#begin('~/.vim/plugged')
  Plug 'tomasiser/vim-code-dark'
  Plug 'jacoborus/tender.vim'
  Plug 'morhetz/gruvbox'
  Plug 'pangloss/vim-javascript'
  Plug 'pangloss/vim-javascript'
  Plug 'itchyny/lightline.vim'
  Plug 'itchyny/vim-gitbranch'
  Plug 'szw/vim-maximizer'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'kassio/neoterm'
  Plug 'tpope/vim-commentary'
  Plug 'sbdchd/neoformat'
  Plug 'tpope/vim-fugitive'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  "Plug 'airblade/vim-gitgutter'

  "autocompletion
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  "typing
  Plug 'jiangmiao/auto-pairs' "press cs to wrap inside 
  Plug 'tpope/vim-surround'
  Plug 'alvan/vim-closetag'

  "IDE
  Plug 'editorconfig/editorconfig-vim'
  Plug 'yggdroot/indentline'

call plug#end()
"Default configurations
set completeopt=menu,noinsert,noselect
set encoding=utf-8
set mouse=a
set splitright
set splitbelow
set expandtab
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase
set diffopt+=vertical
set hidden
set relativenumber
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
filetype plugin indent on
let mapleader = " "
if (has("termguicolors"))
	set termguicolors
endif
let g:netrw_banner=0
let g:markdown_fenced_languages = ['javascript','js=javascript','json=javascript']

"Template for c++ file
:autocmd BufNewFile *.cpp 0r ~/dev/competitive/plantilla.cpp

colorscheme gruvbox

"Basic Mapping
"the <CR> is like pressing enter
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <Esc> :noh<CR>

"Autocenter when enters in insert mode
autocmd InsertEnter * norm zz
" szw/vim-maximizer
nnoremap <leader>m :MaximizerToggle!<CR>

"Neoterm
let g:neoterm_default_mod = 'vertical'
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_term_per_tab = 1
nnoremap <c-q> :Ttoggle<CR>
inoremap <c-q> <Esc>:Ttoggle<CR>
tnoremap <c-q> <c-\><c-n>:Ttoggle<CR>
if has('nvim')
  au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
endif
set nocompatible
filetype off
let &runtimepath.=',~/.vim/bundle/neoterm'
filetype plugin on


"sbdchd/neoformat
nnoremap <leader>F :Neoformat<CR>

"ligthline
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch','readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'gitbranch#name'
  \ },
  \ }


source ~/.config/nvim/coc.vim
