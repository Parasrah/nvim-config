" Exit if we are in Oni
if exists("g:gui_oni")
  finish
endif

" Theme
packadd! onedark.vim

" Interface

" General languages
packadd! deoplete.nvim
packadd! denite.nvim
packadd! echodoc

" Javascript/Typescript
packadd! vim-javascript
packadd! yats.vim
packadd! nvim-typescript

" Elm
packadd! deoplete-elm
packadd! elm-vim

" JSON
packadd! vim-json

" Other languages
" TODO Same format as main packages file
packadd! fzf
packadd! nerdtree
packadd! ale
