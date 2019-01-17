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
  " --- General --- "
  packadd! vim-commentary

  " --- File Management --- "
  packadd! fzf
  packadd! nerdtree

  " --- Interface --- "
  packadd! gruvbox
  packadd! onedark.vim
  packadd! ayu-vim
  " packadd! dracula
  packadd! vim-devicons
  packadd! vim-airline
  packadd! vim-airline-themes

  " --- Linting/Autocompletion --- "
  packadd! coc.nvim
  " TODO: Remove?
  " packadd! deoplete.nvim
  packadd! denite.nvim
  " TODO: Remove?
  " packadd! echodoc
  " TODO: Remove?

  " --- Language --- "
  " packadd! languageclient-neovim
  packadd! vim-javascript
  packadd! vim-jsx
  packadd! yats.vim
  packadd! elm-vim
  packadd! vim-markdown
  packadd! rust.vim
  packadd! vim-gdscript
  packadd! vim-vue
endif
