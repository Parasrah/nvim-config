command! PackUpdate packadd minpac | source $NVIMCONFIG/init.vim | redraw | call minpac#update()
command! PackClean  packadd minpac | source $NVIMCONFIG/init.vim | call minpac#clean()

" For a paranoia.
" Normally `:set nocp` is not needed, because it is done automatically
" when .vimrc is found.
if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

" -- Configuration --

" Add Packages
source $NVIMCONFIG/packages.vim
source $NVIMCONFIG/load.vim

" Load configs
source $NVIMCONFIG/settings.vim
source $NVIMCONFIG/keymaps.vim
source $NVIMCONFIG/commands.vim

" -- END --
