set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/Vim-colors-solarized' " solarized dark color theme
Plugin 'tpope/vim-fugitive' " vim git commands
Plugin 'ctrlpvim/ctrlp.vim' " fuzzy file search
Plugin 'sjl/gundo.vim' " undo tree visualizer
Plugin 'Valloric/YouCompleteMe' " good autocomplete
Plugin 'christoomey/vim-tmux-navigator' " tmux navigation integration
Plugin 'tpope/vim-commentary' " (un)comment stuff
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-surround' " surround commands
Plugin 'gioele/vim-autoswap' " saner swap file handling
Plugin 'vivien/vim-linux-coding-style' " linux coding style enforcement
Plugin 'rdnetto/YCM-Generator' " YCM in non-cmake environments
Plugin 'python-mode/python-mode' " better python
Plugin 'solarnz/thrift.vim' " syntax highlighting for thrift

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

set clipboard=unnamed " use system clipboard by default

set laststatus=2 " always show status line


set lazyredraw " redraw only when we need to.
set showmatch " highlight matching [{()}]

set incsearch " search without presssing enter
" set hlsearch " highlight search matches
" nnoremap <CR> :noh<CR><CR> " clear search highlight on enter
set ignorecase " case insensitive by default
set smartcase " do case sensitive if using upper case

set foldenable " enable folding
set foldlevelstart=4
nnoremap <space> za " <space> opens/closes folds
set foldmethod=indent

" move vertically by visual line (move into the middle of a virtual line that
" is multiple lines because of wrapping
nnoremap j gj
nnoremap k gk

" nicer window movement keys
map <C-J> <C-W>j
map <C-K> <C-W>k

" better file tab completition
set wildmode=longest,list,full
set wildmenu

let mapleader="," " leader is comma
nnoremap <leader>u :GundoToggle<CR> " <leader>u opens gundo

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '__pycache__|\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|o|dll|DS_Store)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_use_caching=1
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_max_depth=40
let g:ctrlp_max_files=0
let g:ctrlp_working_path_mode=0 " ctrlp only in vim cwd

" The Silver Searcher (faster than grep)
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" backup in separate directory
set directory=$HOME/.vim/swapfiles//
let g:autoswap_detect_tmux = 1 " enable autoswap to switch tmux panes

set cc=80
set tw=0

" python
" close documentation window automatically
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:syntastic_python_pyflakes_exec = "pyflakes3"
" let g:pymode_python = "python3"
" rope makes completion super slow
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope = 0

" enable ycm in non-cmake cases
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
set shortmess+=c " fix user defined error
" youcompleteme @ fb
let g:ycm_python_binary_path = '/usr/local/fbcode/gcc-5-glibc-2.23/bin/python2.7'

" fb filetypes
augroup filetypedetect
  au BufRead,BufNewFile *.cinc setfiletype python
  au BufRead,BufNewFile *.cconf setfiletype python
augroup END
