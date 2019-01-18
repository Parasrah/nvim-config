if !exists('*minpac#init')
  " Exit file if not loaded
  finish
endif

" ------------------------------
"                             ||
"           Minpac            ||
"                             ||
"-------------------------------

call minpac#init({ 'verbose': 0 })
call minpac#add('k-takata/minpac', { 'type': 'opt' })

" ------------------------------
"                             ||
"           General           ||
"                             ||
"-------------------------------

" Utilities
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-commentary', { 'type': 'opt' })
call minpac#add('tpope/vim-dispatch')
call minpac#add('nelstrom/vim-visual-star-search')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('wesq3/vim-windowswap')
call minpac#add('mattn/emmet-vim')

" Snippets
call minpac#add('SirVer/ultisnips')

" Text Objects
call minpac#add('kana/vim-textobj-entire')
call minpac#add('kana/vim-textobj-user')
call minpac#add('kana/vim-textobj-indent')
call minpac#add('kana/vim-textobj-line')

" --------------------------------------------------------------- "
"       Generally the rest of the plugins are provided by oni
"       and are hence loaded optionally in 'load.vim'
" --------------------------------------------------------------- "

" ------------------------------
"                             ||
"      File Management        ||
"                             ||
"-------------------------------

call minpac#add('scrooloose/nerdtree', { 'type': 'opt' })
call minpac#add('junegunn/fzf', { 'type': 'opt' })

" ----------------------------------
"                                 ||
" General Linting-Autocompletion  ||
"                                 ||
"-----------------------------------

call minpac#add('w0rp/ale', { 'type': 'opt', 'do': '!npm i -g tslint eslint' })
call minpac#add('Shougo/denite.nvim', { 'type': 'opt' })
call minpac#add('neoclide/coc.nvim', { 'type': 'opt', 'do': 'call coc#util#install()' })

" ------------------------------
"                             ||
"         Interface           ||
"                             ||
"-------------------------------

" Themes
call minpac#add('morhetz/gruvbox', { 'type': 'opt' })
call minpac#add('joshdick/onedark.vim', { 'type': 'opt' })
call minpac#add('arcticicestudio/nord-vim', { 'type': 'opt' })

" Other
call minpac#add('ryanoasis/vim-devicons', { 'type': 'opt' })
call minpac#add('vim-airline/vim-airline', { 'type': 'opt' })
call minpac#add('vim-airline/vim-airline-themes', { 'type': 'opt' })

" ------------------------------
"                             ||
"          LANGUAGES          ||
"                             ||
" ------------------------------

" Javascript/Typescript
call minpac#add('pangloss/vim-javascript', { 'type': 'opt' })
call minpac#add('mxw/vim-jsx', { 'type': 'opt' })
call minpac#add('herringtondarkholme/yats.vim', { 'type': 'opt' })

" Elm
call minpac#add('elmcast/elm-vim', { 'type': 'opt' })

" Markdown
call minpac#add('tpope/vim-markdown', { 'type': 'opt' })

" JSON
call minpac#add('elzr/vim-json', { 'type': 'opt' })

" Rust
call minpac#add('rust-lang/rust.vim', { 'type': 'opt' })

" GDScript
call minpac#add('quabug/vim-gdscript', { 'type': 'opt' })

" Vue
call minpac#add('posva/vim-vue', { 'type': 'opt' })

" -- END
