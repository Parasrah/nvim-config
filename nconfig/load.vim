" -- Both -- "

" Oni is lacking proper support for tslint
packadd! ale

" vim-json provides better JSON experience than Oni
packadd! vim-json

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
  packadd! vim-airline
  packadd! vim-airline-themes
  packadd! echodoc.vim

  " devicons not setup/supported on wsl
  if g:DetectOS() == 'linux'
      " still no mono nerdfonts
      " packadd! vim-devicons
  endif

  " --- Linting/Autocompletion --- "
  packadd! coc.nvim
  packadd! LanguageClient-neovim
  packadd! denite.nvim

  " --- Language --- "
  packadd! Ionide-vim
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
  packadd! omnisharp-vim
endif
