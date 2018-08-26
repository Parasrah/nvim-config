if !exists('*minpac#init')
  " Exit file if not loaded
  finish
endif

call minpac#init({ 'verbose': 0 })

call minpac#add('k-takata/minpac', { 'type': 'opt' })

" General
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-obsession')
call minpac#add('nelstrom/vim-visual-star-search')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('tpope/vim-commentary')

" Text Objects
call minpac#add('kana/vim-textobj-entire')
call minpac#add('kana/vim-textobj-user')
call minpac#add('kana/vim-textobj-indent')
call minpac#add('kana/vim-textobj-line')

" File Management
call minpac#add('scrooloose/nerdtree')
call minpac#add('junegunn/fzf')

" General Linting/Autocompletion
call minpac#add('w0rp/ale', { 'do': jobstart('yarn global add tslint eslint') })
call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
call minpac#add('Shougo/denite.nvim')
call minpac#add('shougo/echodoc')

" Themes
call minpac#add('joshdick/onedark.vim', { 'type': 'opt' })

" Interface
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

" -- LANGUAGES --
" Javascript/Typescript
call minpac#add('mhartington/nvim-typescript', { 'do': jobstart('./install.sh && yarn global add typescript neovim') })
call minpac#add('pangloss/vim-javascript')
call minpac#add('HerringtonDarkholme/yats.vim')

" Elm
call minpac#add('pbogut/deoplete-elm', { 'do': jobstart('yarn global add elm-oracle elm') })
call minpac#add('elmcast/elm-vim')

" Markdown
call minpac#add('tpope/vim-markdown')

" JSON
call minpac#add('elzr/vim-json')

" Rust
call minpac#add('rust-lang/rust.vim')
call minpac#add('racer-rust/vim-racer')

" GDScript
call minpac#add('quabug/vim-gdscript')

" -- END
