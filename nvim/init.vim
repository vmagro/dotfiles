call plug#begin('~/.local/share/nvim/plugged')


" great autocomplete plugin
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" automatically compile, lint, etc
Plug 'neomake/neomake'

" switch between vim and tmux panes easily
Plug 'christoomey/vim-tmux-navigator'

" python tools
" autcomplete
Plug 'zchee/deoplete-jedi'

" golang tools
Plug 'fatih/vim-go'
Plug 'godoctor/godoctor.vim'

" Initialize plugin system
call plug#end()

" enable deoplete
call deoplete#enable()

" enable neomake automatic operation
" When writing a buffer.
call neomake#configure#automake('w')
" When writing a buffer, and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing.
call neomake#configure#automake('rw', 1000)
