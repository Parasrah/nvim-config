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
let g:nestedConfigDir = $NVIMCONFIG."/nconfig/"

" Add Packages
exec "so" g:nestedConfigDir."packages.vim"
exec "so" g:nestedConfigDir."load.vim"

" Load configs
exec "so" g:nestedConfigDir."settings.vim"
exec "so" g:nestedConfigDir."filetypes.vim"
exec "so" g:nestedConfigDir."keymaps.vim"
exec "so" g:nestedConfigDir."commands.vim"

" -- END --
