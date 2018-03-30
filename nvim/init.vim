call plug#begin('~/.local/share/nvim/plugged')


" great autocomplete plugin
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" automatically compile, lint, etc
Plug 'neomake/neomake'

" switch between vim and tmux panes easily
Plug 'christoomey/vim-tmux-navigator'

" ui related plugins
Plug 'agude/vim-eldar'

" python tools
Plug 'zchee/deoplete-jedi' " autocomplete

" golang tools
Plug 'fatih/vim-go'
Plug 'godoctor/godoctor.vim'

Plug 'vim-airline/vim-airline' " cool airline status bar at bottom
Plug 'tpope/vim-commentary' " (un)comment stuff
Plug 'tpope/vim-surround' " surround commands (ysiw etc)
Plug 'gioele/vim-autoswap' " saner swap file handling - switch to open version

" fuzzy file search
Plug 'junegunn/fzf.vim'
Plug '~/go/src/github.com/junegunn/fzf'

" nicer terminal plugins to make neovim replace tmux
Plug 'mklabs/split-term.vim'

" ctags plugin
Plug 'ludovicchabant/vim-gutentags'

" fish editor
Plug 'dag/vim-fish'

" Initialize plugin system
call plug#end()

" simple display configuration
" show relative line numbers
set relativenumber " relative line numbers in gutter
set number " show curent line number absolute not relative
set cursorline " highlight current line

syntax enable
"- this breaks (I think because of my iterm colorscheme)
"set termguicolors 
colorscheme eldar

" tabs suck, use spaces instead
set tabstop=2
set shiftwidth=2
set expandtab
filetype plugin indent on

" hit enter to stop search highlight
nnoremap <CR> :noh<CR><CR>


" Start deoplete

" tell deoplete about python
let g:python3_host_prog = '/home/vmagro/virtualenvs/py3neovim/bin/python3.6'

" Let <Tab> also do completion
inoremap <silent><expr> <Tab>  pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" Let <shift-Tab> go backwards in the options
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" enable deoplete
let g:deoplete#enable_at_startup = 1

" end deoplete

" enable neomake automatic operation
" When writing a buffer.
call neomake#configure#automake('w')
" When writing a buffer, and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing.
call neomake#configure#automake('rw', 1000)

" set gutentag to use exctags instead of ctags
if executable('exctags')
  let g:gutentags_ctags_executable = 'exctags'
endif


" make ctrlp faster with ripgrep
if executable('rg')		
  " Use rg over grep		
  set grepprg=rg\ --color=never
  	
  " Use rg in CtrlP for listing files. Lightning fast and respects .gitignore		
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  	
  " rg is fast enough that CtrlP doesn't need to cache		
  let g:ctrlp_use_caching = 0		
endif

" FB specific
" set configs to use python syntax
autocmd BufNewFile,BufRead *.cconf set syntax=python
autocmd BufNewFile,BufRead *.cinc set syntax=python
autocmd BufNewFile,BufRead *.mcconf set syntax=python
autocmd BufNewFile,BufRead *.tw set syntax=python
" set BUCK to use python syntax
autocmd BufNewFile,BufRead BUCK set syntax=python
autocmd BufNewFile,BufRead TARGETS set syntax=python
