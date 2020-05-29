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
"           Toggles           ||
"                             ||
"===============================

let s:airline_enabled = 1
let s:builtin_lsp_enabled = 0

" ==============================
"                             ||
"           Legend            ||
"                             ||
"===============================

" 🔪 - removal in progress
" 😞 - would love to remove

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
call g:AddPackage({ 'repo': 'tpope', 'package': 'vim-unimpaired' })
call g:AddPackage({ 'repo': 'tpope', 'package': 'vim-projectionist' })
" testing out with it off to see if I actually need it
call g:AddPackage({ 'repo': 'raimondi', 'package': 'delimitmate', 'enable': 0 })
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

" ==============================
"                             ||
"            Linting          ||
"                             ||
"===============================

call g:AddPackage({ 'repo': 'dense-analysis', 'package': 'ale' }) " 😞

" ==============================
"                             ||
"           Completion        ||
"                             ||
"===============================

call g:AddPackage({ 'repo': 'neovim', 'package': 'nvim-lsp', 'enable': s:builtin_lsp_enabled })
call g:AddPackage({ 'repo': 'neoclide', 'package': 'coc.nvim', 'enable': !s:builtin_lsp_enabled, 'config': { 'branch': 'release' } }) " 🔪
call g:AddPackage({ 'repo': 'omnisharp', 'package': 'omnisharp-vim', 'enable': 1 }) " 😞 - also see echodoc

" ==============================
"                             ||
"         Interface           ||
"                             ||
"===============================

call g:AddPackage({ 'repo': 'morhetz', 'package': 'gruvbox' })
call g:AddPackage({ 'repo': 'joshdick', 'package': 'onedark.vim' })

call g:AddPackage({ 'repo': 'Shougo', 'package': 'echodoc.vim' }) " 😞
call g:AddPackage({ 'repo': 'vim-airline', 'package': 'vim-airline', 'enable': s:airline_enabled }) " 🔪
call g:AddPackage({ 'repo': 'vim-airline', 'package': 'vim-airline-themes', 'enable': s:airline_enabled }) " 🔪

" ==============================
"                             ||
"          LANGUAGES          ||
"                             ||
" ==============================

" TODO: might be able to remove this after tree-sitter makes it into stable
call g:AddPackage({ 'repo': 'sheerun', 'package': 'vim-polyglot' }) " 😞
call g:AddPackage({ 'repo': 'quabug', 'package': 'vim-gdscript' })
