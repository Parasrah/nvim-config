" ==============================
"                             ||
"           Minpac            ||
"                             ||
"===============================

if exists('*minpac#init')
	call minpac#init({ 'verbose': 0 })
endif
call g:AddPackage({ 'repo': 'k-takata', 'package': 'minpac' })

" ==============================
"                             ||
"           General           ||
"                             ||
"===============================

" Utilities
call g:AddPackage({ 'repo': 'tpope', 'package': 'vim-fugitive' })
call g:AddPackage({ 'repo': 'tpope', 'package': 'vim-surround' })
call g:AddPackage({ 'repo': 'tpope', 'package': 'vim-repeat' })
call g:AddPackage({ 'repo': 'tpope', 'package': 'vim-dispatch' })
call g:AddPackage({ 'repo': 'tpope', 'package': 'vim-commentary' })
call g:AddPackage({ 'repo': 'tpope', 'package': 'vim-obsession' })
call g:AddPackage({ 'repo': 'tpope', 'package': 'vim-dadbod' })
call g:AddPackage({ 'repo': 'nelstrom', 'package': 'vim-visual-star-search' })
call g:AddPackage({ 'repo': 'wesq3', 'package': 'vim-windowswap' })
call g:AddPackage({ 'repo': 'mattn', 'package': 'emmet-vim' })
call g:AddPackage({ 'repo': 'raimondi', 'package': 'delimitmate' })
call g:AddPackage({ 'repo': 'editorconfig', 'package': 'editorconfig-vim' })

" Text Objects
call g:AddPackage({ 'repo': 'kana', 'package': 'vim-textobj-entire' })
call g:AddPackage({ 'repo': 'kana', 'package': 'vim-textobj-user' })
call g:AddPackage({ 'repo': 'kana', 'package': 'vim-textobj-indent' })
call g:AddPackage({ 'repo': 'kana', 'package': 'vim-textobj-line' })

" ==============================
"                             ||
"      File Management        ||
"                             ||
"===============================

call g:AddPackage({ 'repo': 'tpope', 'package': 'vim-vinegar' })
call g:AddPackage({ 'repo': 'junegunn', 'package': 'fzf', 'config': { 'do': '!./install --bin' } })

" ==================================
"                                 ||
" General Linting-Autocompletion  ||
"                                 ||
"===================================

call g:AddPackage({ 'repo': 'w0rp', 'package': 'ale' })
call g:AddPackage({ 'repo': 'neoclide', 'package': 'coc.nvim', 'config': { 'do': 'call coc#util#install()' } })

" ==============================
"                             ||
"         Interface           ||
"                             ||
"===============================

" Themes
call g:AddPackage({ 'repo': 'morhetz', 'package': 'gruvbox' })
call g:AddPackage({ 'repo': 'joshdick', 'package': 'onedark.vim' })
call g:AddPackage({ 'repo': 'arcticicestudio', 'package': 'nord-vim' })

" Other
call g:AddPackage({ 'repo': 'ryanoasis', 'package': 'vim-devicons' })
call g:AddPackage({ 'repo': 'Shougo', 'package': 'echodoc.vim' })
let g:airline_enabled = 0
call g:AddPackage({ 'repo': 'vim-airline', 'package': 'vim-airline', 'enable': g:airline_enabled })
call g:AddPackage({ 'repo': 'vim-airline', 'package': 'vim-airline-themes', 'enable': g:airline_enabled })

" ==============================
"                             ||
"          LANGUAGES          ||
"                             ||
" ==============================

call g:AddPackage({ 'repo': 'sheerun', 'package': 'vim-polyglot' })
call g:AddPackage({ 'repo': 'quabug', 'package': 'vim-gdscript' })
call g:AddPackage({ 'repo': 'omnisharp', 'package': 'omnisharp-vim' })
