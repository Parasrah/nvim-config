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

" File Management
call minpac#add('scrooloose/nerdtree')
call minpac#add('junegunn/fzf')

" General Linting/Autocompletion
call minpac#add('valloric/youcompleteme', { 'do': jobstart('./install.py') })
call minpac#add('w0rp/ale')

" Themes
call minpac#add('joshdick/onedark.vim', { 'type': 'opt' })

" Interface
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('mhinz/vim-startify')

" Elm
call minpac#add('elmcast/elm-vim')

" Markdown
call minpac#add('tpope/vim-markdown')

" Javascript/Typescript
call minpac#add('mhartington/nvim-typescript', { 'type': 'opt' , 'do': jobstart('./install.sh') })
call minpac#add('Shougo/deoplete.nvim')
call minpac#add('Shougo/denite.nvim')
call minpac#add('pangloss/vim-javascript')
call minpac#add('HerringtonDarkholme/yats.vim')

" -- END
