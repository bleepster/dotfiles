" load 'sensible' defaults
runtime! plugin/sensible.vim

set cursorline
set number
set termguicolors
filetype plugin on

" shamelessly copy-pasted from:
" https://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

colorscheme gruvbox

" routine for toggling dark/light mode based on time, taken from:
" https://stackoverflow.com/a/7589970
if strftime("%H") > 18
    set background=dark
    let g:gruvbox_contrast_dark="medium"
else
    set background=light
    let g:gruvbox_contrast_light="hard"
endif
