" -- Commands -- "

command! Config tabnew $NVIMCONFIG/settings.vim
      \ | :below :vs $NVIMCONFIG/filetypes.vim
      \ | :below :sp $NVIMCONFIG/commands.vim
      \ | :wincmd h
      \ | :below :sp $NVIMCONFIG/keymaps.vim
      \ | :wincmd k

command! Packages tabnew $NVIMCONFIG/packages.vim
      \ | :below :sp $NVIMCONFIG/load.vim
      \ | :wincmd k

" Terminal
command! Term bo :17sp term://bash

" Git
command! Done w | :bdelete

" Grep
command! -nargs=1 SearchJs lgrep <q-args> -g "**/*.{js,jsx}"
command! -nargs=1 SearchTs lgrep <q-args> -g "**/*.{ts,tsx}"
command! -nargs=1 SearchRs lgrep <q-args> -g "**/*.rs"
command! -nargs=1 SearchScss lgrep <q-args> -g "**/*.scss"
