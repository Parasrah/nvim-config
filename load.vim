" -- Load -- "
" Load the opt plugins "

if !exists('g:gui_oni')

  packadd! onedark.vim
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
  packadd! vim-json
  packadd! rust.vim
  packadd! vim-gdscript

endif

if exists('g:gui_oni')
  " packadd! oni-plugin-tslint
endif
