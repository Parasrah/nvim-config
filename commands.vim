" -- Commands -- "

command! Config tabnew $NVIMCONFIG/settings.vim
      \ | :below :sp $NVIMCONFIG/commands.vim
      \ | :below :vs $NVIMCONFIG/keymaps.vim
      \ | :wincmd k

command! Packages tabnew $NVIMCONFIG/packages.vim
      \ | :below :sp $NVIMCONFIG/load.vim
      \ | :wincmd k

" Terminal
command! Term bo :20sp term://bash

" Git
command! Done w | :bdelete
