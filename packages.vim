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

" Elm
call minpac#add('elmcast/elm-vim')

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

" -- END
