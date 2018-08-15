call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ayu-theme/ayu-vim'
Plug 'elmcast/elm-vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'valloric/youcompleteme'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'yggdroot/indentline'
call plug#end()

" Themes
set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

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

