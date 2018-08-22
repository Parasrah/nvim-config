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
call minpac#add('scrooloose/nerdtree', { 'type': 'opt' })
call minpac#add('junegunn/fzf', { 'type': 'opt' })

" General Linting/Autocompletion
call minpac#add('valloric/youcompleteme', { 'do': jobstart('./install.py'), 'type': 'opt' })
call minpac#add('w0rp/ale', { 'type': 'opt' })

" Themes
call minpac#add('joshdick/onedark.vim', { 'type': 'opt' })

" Interface
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

" Elm
call minpac#add('elmcast/elm-vim', { 'type': 'opt' })

" Markdown
call minpac#add('tpope/vim-markdown')

" Javascript/Typescript
call minpac#add('mhartington/nvim-typescript', { 'type': 'opt' , 'do': jobstart('./install.sh') })
call minpac#add('Shougo/deoplete.nvim', { 'type': 'opt' })
call minpac#add('Shougo/denite.nvim', { 'type': 'opt' })
call minpac#add('pangloss/vim-javascript', { 'type': 'opt' })
call minpac#add('HerringtonDarkholme/yats.vim', { 'type': 'opt' })
call minpac#add('quramy/tsuquyomi', { 'type': 'opt' })
call minpac#add('Shougo/vimproc.vim', { 'type': 'opt' }, { 'do': jobstart('make') })
call minpac#add('shougo/echodoc', { 'type': 'opt' })

" -- END
