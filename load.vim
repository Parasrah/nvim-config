" -- Load -- "

" -- NeoVim -- "
if !exists("g:gui_oni")
  packadd! onedark.vim
  packadd! vim-commentary
  packadd! deoplete.nvim
  packadd! denite.nvim
  packadd! echodoc
  packadd! ale
  packadd! fzf
  packadd! languageclient-neovim
  packadd! nerdtree
  packadd! vim-airline
  packadd! vim-airline-themes
  packadd! vim-javascript
  packadd! typescript-vim
  packadd! elm-vim
  packadd! vim-markdown
  packadd! rust.vim
  packadd! vim-gdscript
  packadd! vim-vue
endif


if exists("g:gui_oni")
  " packadd! oni-plugin-tslint
endif
