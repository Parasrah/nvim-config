set hidden
set linebreak
set shortmess=cfilnxtToOIF
set modelines=5
set wildmode=longest,list
set wildmenu
set completeopt-=preview
set signcolumn=no
set nobackup
set nowritebackup
set expandtab
set shiftwidth=4
set softtabstop=4
set nonumber
set history=400
set noshowmode
set noruler
set laststatus=0
set ignorecase
set smartcase

tnoremap <esc> <C-\><C-n>
tnoremap <C-v><esc> <esc>
command! Term bo :sp term://bash
command! Tarm tabnew term://bash
term
