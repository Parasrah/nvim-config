" -- Commands -- "

function! s:OpenConfig()
  exec "tabnew" g:nestedConfigDir."settings.vim"
  exec "below :vs" g:nestedConfigDir."filetypes.vim"
  exec "below :sp" g:nestedConfigDir."keymaps.vim"
  wincmd h
  exec "below :sp" g:nestedConfigDir."commands.vim"
  wincmd k
endfunction

function! s:OpenPackages()
  exec "tabnew" g:nestedConfigDir."packages.vim"
  exec "below :vs" g:nestedConfigDir."load.vim"
  wincmd h
endfunction

command! Config call s:OpenConfig()
command! Packages call s:OpenPackages()

" Terminal
command! Term bo :17sp term://bash

" Git
command! Done w | :bdelete

" Grep
command! -nargs=1 SearchJs lgrep <q-args> -g "**/*.{js,jsx,html}"
command! -nargs=1 SearchTs lgrep <q-args> -g "**/*.{ts,tsx}"
command! -nargs=1 SearchRs lgrep <q-args> -g "**/*.rs"
command! -nargs=1 SearchMyElm lgrep <q-args> -g "**/*.elm"
command! -nargs=1 SearchStyle lgrep <q-args> -g "**/*.{css,scss}"
