set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/Vim-colors-solarized' " solarized dark color theme
Plugin 'tpope/vim-fugitive' " vim git commands
Plugin 'kien/ctrlp.vim' " fuzzy file search
Plugin 'sjl/gundo.vim' " undo tree visualizer
Plugin 'Valloric/YouCompleteMe' " good autocomplete
Plugin 'christoomey/vim-tmux-navigator' " tmux navigation integration
Plugin 'tpope/vim-commentary' " (un)comment stuff
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required for vundle


syntax enable
set background=dark
colorscheme solarized

set backspace=indent,eol,start "allow backspacing over newline, and autoindent

filetype indent on " load filetype-specific indent files
set tabstop=2
set softtabstop=2
set expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

set relativenumber " relative line numbers
set number " show current line number
set cursorline " highlight current line

" enable mouse mode
set mouse+=a
if &term =~ '^screen'
  " tmux knows the extended mouse mode
  set ttymouse=xterm2 " need this for resizable splits
endif

set laststatus=2 " always show status line


set lazyredraw " redraw only when we need to.
set showmatch " highlight matching [{()}]

set incsearch " search without presssing enter
set hlsearch " highlight search matches
nnoremap <CR> :noh<CR><CR> " clear search highlight on enter

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
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" backup in separate directory
set directory=$HOME/.vim/swapfiles//
