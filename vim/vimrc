set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/Vim-colors-solarized'
Plugin 'tpope/vim-fugitive' " vim git commands

Plugin 'kien/ctrlp.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required for vundle


syntax enable
set background=dark
colorscheme solarized

set backspace=indent,eol,start "allow backspacing over newline, and autoindent

set tabstop=2
set softtabstop=2
set expandtab

set relativenumber " relative line numbers
set number " show current line number
set cursorline " highlight current line

filetype indent on " load filetype-specific indent files

set lazyredraw " redraw only when we need to.
set showmatch " highlight matching [{()}]

set incsearch " search without presssing enter
set hlsearch " highlight search matches

set foldenable " enable folding
set foldlevelstart=4
nnoremap <space> za " <space> opens/closes folds
set foldmethod=indent

" move vertically by visual line (move into the middle of a virtual line that
" is multiple lines because of wrapping
nnoremap j gj
nnoremap k gk

let mapleader="," " leader is comma
nnoremap <leader>u :GundoToggle<CR> " <leader>u opens gundo

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
