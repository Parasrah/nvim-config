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

" Grep
command! -nargs=1 SearchJs lgrep <q-args> -g "**/*.{js,jsx}"
command! -nargs=1 SearchTs lgrep <q-args> -g "**/*.{ts,tsx}"
command! -nargs=1 SearchRs lgrep <q-args> -g "**/*.rs"
