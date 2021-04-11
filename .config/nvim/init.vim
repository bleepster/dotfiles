runtime! plugin/sensible.vim

set cursorline
set number
set termguicolors
set colorcolumn=80
set scrolloff=12

set statusline=%f\ %h%w%m%r
set statusline+=%=%(%l,%c%V\ %=\ %P%)

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark="soft"

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua require'lspinstall'.setup()

lua <<EOF
local servers=require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
    require'lspconfig'[server].setup{
        on_attach=require'completion'.on_attach
    }
end
EOF
