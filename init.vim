call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'elmcast/elm-vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'valloric/youcompleteme'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'yggdroot/indentline'
Plug 'jiangmiao/auto-pairs'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/denite.nvim'
Plug 'joshdick/onedark.vim'
call plug#end()

" Custom commands

command Config vs ~/.config/nvim/init.vim

" Themes
set termguicolors     " enable true colors support
syntax on
colorscheme onedark

" Deopletu
let g:deoplete#enable_at_startup = 1

" File plugin
filetype plugin indent on

" Javascript
let g:javascript_plugin_jsdoc = 1

" Line numbers
set number

" IndentLine {{
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}

" NERDTree
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'

" Startup layout
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd VimEnter * nested split term://bash
autocmd VimEnter * wincmd x 
autocmd VimEnter * res +10

" -- END --

