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
command! Tarm tabnew term://bash

" Git
command! Done w | :bdelete

" Grep
command! -nargs=1 JS lgrep <q-args> -g "**/*.{js,jsx,html}"
command! -nargs=1 JSON lgrep <q-args> -g "**/*.json"
command! -nargs=1 TS lgrep <q-args> -g "**/*.{ts,tsx,html}"
command! -nargs=1 RS lgrep <q-args> -g "**/*.rs"
command! -nargs=1 ELM lgrep <q-args> -g "**/*.elm"
command! -nargs=1 STL lgrep <q-args> -g "**/*.{css,scss}"
command! -nargs=1 GO lgrep <q-args> -g "**/*.go"
command! -nargs=1 GD lgrep <q-args> -g "**/*.gd"
