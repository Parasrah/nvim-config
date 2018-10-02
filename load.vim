" -- Load -- "

" -- Both

" Dummy conditional to easily disable
if 1 == 1
  packadd! ale
endif

" -- NeoVim -- "
if !exists("g:gui_oni")
  packadd! onedark.vim
  packadd! vim-devicons
  packadd! vim-commentary
  packadd! deoplete.nvim
  packadd! denite.nvim
  packadd! echodoc
  packadd! fzf
  packadd! languageclient-neovim
  packadd! nerdtree
  packadd! vim-airline
  packadd! vim-airline-themes
  packadd! vim-javascript
  packadd! yats.vim
  packadd! elm-vim
  packadd! vim-markdown
  packadd! rust.vim
  packadd! vim-gdscript
  packadd! vim-vue
  packadd! vim-racer
endif
