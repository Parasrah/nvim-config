" -- Both -- "

if 1 == 1
  " Oni is lacking proper support for tslint
  packadd! ale

  " vim-json provides better JSON experience than Oni
  packadd! vim-json
endif

" -- Terminal -- "

if !exists("g:gui_oni")
  " --- General --- "
  packadd! vim-commentary
  packadd! vim-obsession

  " --- File Management --- "
  packadd! fzf
  packadd! vim-vinegar

  " --- Interface --- "
  packadd! gruvbox
  packadd! onedark.vim
  packadd! nord-vim
  " packadd! vim-devicons
  packadd! vim-airline
  packadd! vim-airline-themes

  " --- Linting/Autocompletion --- "
  packadd! coc.nvim
  packadd! denite.nvim

  " --- Language --- "
  packadd! vim-javascript
  packadd! vim-jsx
  packadd! yats.vim
  packadd! elm-vim
  packadd! vim-markdown
  packadd! rust.vim
  packadd! vim-gdscript
  packadd! vim-vue
  packadd! dockerfile.vim
  packadd! vim-go
  packadd! vim-toml
  packadd! vim-elixir
endif
