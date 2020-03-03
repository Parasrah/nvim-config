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
set showtabline=1
set ignorecase
set smartcase

tnoremap <esc> <C-\><C-n>
tnoremap <C-v><esc> <esc>
command! Term bo :sp term://bash
command! Tarm tabnew term://bash

function s:SetupTheme()
    if has('termguicolors')
        packadd! gruvbox
        set termguicolors
        let g:airline_theme = 'gruvbox'
        let g:gruvbox_italic = 0
        let g:gruvbox_bold = 0
        let g:gruvbox_underline = 0
        let g:gruvbox_italicize_comments = 0
        let g:gruvbox_italicize_strings = 0
        set background=dark
        syntax on
        colorscheme gruvbox
    endif
endfunction

call s:SetupTheme()

autocmd VimEnter * term
autocmd VimEnter * startinsert
