" load 'sensible' defaults
runtime! plugin/sensible.vim

set cursorline
set number
set termguicolors

" shamelessly copy-pasted from:
" https://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif
