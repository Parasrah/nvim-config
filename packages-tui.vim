" Exit if we are in Oni
if exists("g:gui_oni")
  finish
endif

packadd! deoplete.nvim
packadd! denite.nvim
packadd! vim-javascript
packadd! yats.vim
packadd! nvim-typescript
" packadd! tsuquyomi
" packadd! vimproc.vim

