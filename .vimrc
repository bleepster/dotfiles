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

" routine for toggling dark/light mode based on time, taken from:
" https://stackoverflow.com/a/7589970
if strftime("%H") > 19
    set background=dark
else
    set background=light
endif
colorscheme gruvbox
let g:gruvbox_contrast_light="soft"
