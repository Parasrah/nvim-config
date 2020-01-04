command! PackUpdate packadd minpac | source $NVIMCONFIG/init.vim | redraw | call minpac#update()
command! PackClean packadd minpac | source $NVIMCONFIG/init.vim | call minpac#clean()
command! Reload source $NVIMCONFIG/init.vim

if &compatible
    set nocompatible
endif

" -- Configuration --
let g:configDir = $NVIMCONFIG
let g:nestedConfigDir = g:configDir."/nconfig/"
let g:luaDir = g:configDir."/lua/"
let g:files = {
    \ 'functions': g:nestedConfigDir."functions.vim",
    \ 'packages': g:nestedConfigDir."packages.vim",
    \ 'settings': g:nestedConfigDir."settings.vim",
    \ 'keymaps': g:nestedConfigDir."keymaps.vim",
    \ 'commands': g:nestedConfigDir."commands.vim",
    \ 'status': g:luaDir."status.lua",
    \ }

" Add Global Functions
exec "so" g:files.functions

" Add Packages
exec "so" g:files.packages

" Load configs
exec "so" g:files.settings
exec "so" g:files.keymaps
exec "so" g:files.commands
