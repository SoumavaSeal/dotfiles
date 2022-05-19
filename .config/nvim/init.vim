"
"    _           _   _                  _
"   (_)  _ __   (_) | |_       __   __ (_)  _ __ ___
"   | | | '_ \  | | | __|      \ \ / / | | | '_ ` _ \
"   | | | | | | | | | |_    _   \ V /  | | | | | | | |
"   |_| |_| |_| |_|  \__|  (_)   \_/   |_| |_| |_| |_|
"


"---------------------------------------------------------
"                       Plugin Settings
"---------------------------------------------------------

source /home/soumava/.config/nvim/plugin-config/coc.vim
source /home/soumava/.config/nvim/plugin-config/nerdcommenter.vim
source /home/soumava/.config/nvim/plugin-config/vimwiki.vim 

"---------------------------------------------------------
"                       Basic Defaults
"---------------------------------------------------------

syntax on

set relativenumber
set clipboard=unnamed
set noerrorbells
set tabstop=4 softtabstop=4 
set expandtab
set shiftwidth=4
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set scrolloff=10
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set nocompatible
set encoding=UTF-8
filetype plugin on

" highlight colorcolumn ctermbg=0 guibg=lightgrey

"---------------------------------------------------------
"                           Plugins
"---------------------------------------------------------

call plug#begin('~/.vim/plugged')

"Side File Explorer for vim
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Comment out multiple lines at once
Plug 'preservim/nerdcommenter'

" Git Integration
Plug 'tpope/vim-fugitive'

"Dart Language Support
Plug 'dart-lang/dart-vim-plugin'

"Vim Wiki
Plug 'vimwiki/vimwiki'

call plug#end()


"---------------------------------------------------------
"                   Leader Key Bindings
"---------------------------------------------------------

"Setting up my leader.
let mapleader=','

"Toggle between windows.
noremap<leader>h :wincmd h<CR>
noremap<leader>j :wincmd j<CR>
noremap<leader>k :wincmd k<CR>
noremap<leader>l :wincmd l<CR>

"source the file.
noremap<leader>s :source %<CR>

"Change pwd to current file directory.
noremap<leader>pwd :cd %:p:h<CR>

"Buffer List
noremap<leader>bl :buffers<CR>

"Tabs
noremap <leader>tn :tabnext<CR>
noremap <leader>tp :tabprevious<CR>
noremap <leader>tf :tabfirst<CR>
noremap <leader>tl :tablast<CR>
noremap <leader>t  :tabnew

"---------------------------------------------------------
"                   Custom Key Bindings
"---------------------------------------------------------

map <C-n> :NERDTreeToggle<CR>

"---------------------------------------------------------
"                   Custom Commands.
"---------------------------------------------------------

"Open the _vimrc file.
command Config :tabedit ~/.config/nvim/init.vim

"Delete current buffer.
command Delete :bdelete
