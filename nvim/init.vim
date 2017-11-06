call plug#begin('~/.local/share/nvim/plugged')


" great autocomplete plugin
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" switch between vim and tmux panes easily
Plug 'christoomey/vim-tmux-navigator'

" golang tools
Plug 'fatih/vim-go'
Plug 'godoctor/godoctor.vim'

" Initialize plugin system
call plug#end()

" enable deoplete
call deoplete#enable()
