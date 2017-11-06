call plug#begin('~/.local/share/nvim/plugged')


" great autocomplete plugin
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" automatically compile, lint, etc
Plug 'neomake/neomake'

" switch between vim and tmux panes easily
Plug 'christoomey/vim-tmux-navigator'

" ui related plugins
Plug 'iCyMind/NeoSolarized' " solarized color scheme

" python tools
" autcomplete
Plug 'zchee/deoplete-jedi'

" golang tools
Plug 'fatih/vim-go'
Plug 'godoctor/godoctor.vim'

" Initialize plugin system
call plug#end()

" simple display configuration
" show relative line numbers
set relativenumber " relative line numbers in gutter
set number " show curent line number absolute not relative
set cursorline " highlight current line

syntax enable

" enable solarized dark
" set termguicolors - this breaks (I think because of my iterm colorscheme)
set background=dark
colorscheme NeoSolarized


" Start deoplete

" tell deoplete about python
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

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
