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
call minpac#add('tpope/vim-commentary', { 'type': 'opt' })
call minpac#add('nelstrom/vim-visual-star-search')
call minpac#add('jiangmiao/auto-pairs')

" Text Objects
call minpac#add('kana/vim-textobj-entire')
call minpac#add('kana/vim-textobj-user')
call minpac#add('kana/vim-textobj-indent')
call minpac#add('kana/vim-textobj-line')

" File Management
call minpac#add('scrooloose/nerdtree', { 'type': 'opt' })
call minpac#add('junegunn/fzf', { 'type': 'opt' })

" General Linting/Autocompletion
call minpac#add('w0rp/ale', { 'type': 'opt', 'do': '!yarn global add tslint eslint' })
call minpac#add('Shougo/deoplete.nvim', { 'type': 'opt', 'do': 'UpdateRemotePlugins' })
call minpac#add('Shougo/denite.nvim', { 'type': 'opt' })
call minpac#add('shougo/echodoc', { 'type': 'opt' })

" Themes
call minpac#add('joshdick/onedark.vim', { 'type': 'opt' })
call minpac#add('ryanoasis/vim-devicons', { 'type': 'opt' })

" Interface
call minpac#add('vim-airline/vim-airline', { 'type': 'opt' })
call minpac#add('vim-airline/vim-airline-themes', { 'type': 'opt' })

" -- LANGUAGES --
"  General
call minpac#add('autozimu/languageclient-neovim', { 'type': 'opt', 'branch': 'next', 'do': '!bash install.sh' })

" Javascript/Typescript
call minpac#add('pangloss/vim-javascript', { 'type': 'opt' })
call minpac#add('herringtondarkholme/yats.vim', { 'type': 'opt' })

" Elm
call minpac#add('elmcast/elm-vim', { 'type': 'opt' })

" Markdown
call minpac#add('tpope/vim-markdown', { 'type': 'opt' })

" JSON
call minpac#add('elzr/vim-json')

" Rust
call minpac#add('rust-lang/rust.vim', { 'type': 'opt' })

" GDScript
call minpac#add('quabug/vim-gdscript', { 'type': 'opt' })

" Vue
call minpac#add('posva/vim-vue', { 'type': 'opt' })

" -- END
