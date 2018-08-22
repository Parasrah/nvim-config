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
packadd! onedark.vim
source $NVIMCONFIG/packages.vim
source $NVIMCONFIG/packages-tui.vim
source $NVIMCONFIG/packages-gui.vim

" Load configs
source $NVIMCONFIG/shared.vim
source $NVIMCONFIG/gui.vim
source $NVIMCONFIG/tui.vim

" -- END --
