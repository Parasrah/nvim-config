" -- Load -- "

" -- Both

" Dummy conditional to easily disable
if 1 == 1
  " Oni is lacking proper support for tslint
  packadd! ale

  " vim-json provides better JSON experience than Oni
  packadd! vim-json
endif

" -- NeoVim -- "
if !exists("g:gui_oni")
  " packadd! dracula
  packadd! gruvbox
  packadd! onedark.vim
  packadd! ayu-vim
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
  packadd! vim-jsx
  packadd! yats.vim
  packadd! elm-vim
  packadd! vim-markdown
  packadd! rust.vim
  packadd! vim-gdscript
  packadd! vim-vue
endif
