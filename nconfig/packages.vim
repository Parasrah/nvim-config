" ==============================
"                             ||
"           Minpac            ||
"                             ||
"===============================

function! s:add(info)
    " TODO: write in lua
    if !has_key(a:info, 'repo')
        echoerr "missing package repo (trying to add package)"
        return
    endif
    if !has_key(a:info, 'package')
        echoerr "missing package name (trying to add package)"
        return
    endif
    let repo = a:info.repo
    let package = a:info.package
    let enable = 1
    if has_key(a:info, 'enable')
        let enable = a:info.enable
    endif
    let defaults = {}
    if has_key(a:info, 'config')
        let defaults = extend(defaults, a:info.config)
    endif
    let config = extend(copy(defaults), { 'type': 'opt' })
    if exists('*minpac#init')
	    call minpac#add(repo.'/'.package, config)
    endif
    if l:enable
	exec "packadd! " . package
    endif
endfunction


if exists('*minpac#init')
	call minpac#init({ 'verbose': 0 })
endif
call s:add({ 'repo': 'k-takata', 'package': 'minpac' })

" ==============================
"                             ||
"           General           ||
"                             ||
"===============================

" Utilities
call s:add({ 'repo': 'tpope', 'package': 'vim-fugitive' })
call s:add({ 'repo': 'tpope', 'package': 'vim-surround' })
call s:add({ 'repo': 'tpope', 'package': 'vim-repeat' })
call s:add({ 'repo': 'tpope', 'package': 'vim-dispatch' })
call s:add({ 'repo': 'tpope', 'package': 'vim-commentary' })
call s:add({ 'repo': 'tpope', 'package': 'vim-obsession' })
call s:add({ 'repo': 'tpope', 'package': 'vim-dadbod' })
call s:add({ 'repo': 'nelstrom', 'package': 'vim-visual-star-search' })
call s:add({ 'repo': 'wesq3', 'package': 'vim-windowswap' })
call s:add({ 'repo': 'mattn', 'package': 'emmet-vim' })
call s:add({ 'repo': 'raimondi', 'package': 'delimitmate' })
call s:add({ 'repo': 'editorconfig', 'package': 'editorconfig-vim' })

" Text Objects
call s:add({ 'repo': 'kana', 'package': 'vim-textobj-entire' })
call s:add({ 'repo': 'kana', 'package': 'vim-textobj-user' })
call s:add({ 'repo': 'kana', 'package': 'vim-textobj-indent' })
call s:add({ 'repo': 'kana', 'package': 'vim-textobj-line' })

" =============================================================== "
"       Generally the rest of the plugins are provided by oni     "
"       and are hence loaded optionally in 'load.vim'             "
" =============================================================== "

" ==============================
"                             ||
"      File Management        ||
"                             ||
"===============================

call s:add({ 'repo': 'tpope', 'package': 'vim-vinegar' })
call s:add({ 'repo': 'junegunn', 'package': 'fzf', 'config': { 'do': '!./install' } })

" ==================================
"                                 ||
" General Linting-Autocompletion  ||
"                                 ||
"===================================

call s:add({ 'repo': 'w0rp', 'package': 'ale' })
call s:add({ 'repo': 'neoclide', 'package': 'coc.nvim', 'config': { 'do': 'call coc#util#install()' } })

" ==============================
"                             ||
"         Interface           ||
"                             ||
"===============================

" Themes
call s:add({ 'repo': 'morhetz', 'package': 'gruvbox' })
call s:add({ 'repo': 'joshdick', 'package': 'onedark.vim' })
call s:add({ 'repo': 'arcticicestudio', 'package': 'nord-vim' })

" Other
call s:add({ 'repo': 'ryanoasis', 'package': 'vim-devicons' })
call s:add({ 'repo': 'vim-airline', 'package': 'vim-airline' })
call s:add({ 'repo': 'vim-airline', 'package': 'vim-airline-themes' })
call s:add({ 'repo': 'Shougo', 'package': 'echodoc.vim' })

" ==============================
"                             ||
"          LANGUAGES          ||
"                             ||
" ==============================

call s:add({ 'repo': 'sheerun', 'package': 'vim-polyglot' })
call s:add({ 'repo': 'quabug', 'package': 'vim-gdscript' })
call s:add({ 'repo': 'omnisharp', 'package': 'omnisharp-vim' })

" -- END
