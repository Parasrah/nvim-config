" -- Commands -- "

function! s:OpenConfig()
    exec "tabnew" g:nestedConfigDir."settings.vim"
    exec "below :vs" g:nestedConfigDir."functions.vim"
    exec "below :sp" g:nestedConfigDir."keymaps.vim"
    wincmd h
    exec "below :sp" g:nestedConfigDir."commands.vim"
    wincmd k
    exec "lcd" g:nestedConfigDir
endfunction

function! s:OpenPackages()
    exec "tabnew" g:nestedConfigDir."packages.vim"
    exec "below :vs" g:nestedConfigDir."load.vim"
    wincmd h
endfunction

function! s:OpenFileTypes()
    exec "tabnew"
    exec "lcd" g:configDir."/ftplugin"
    exec "FZF!"
endfunction

function! s:OpenSnippets()
    exec "tabnew"
    exec "lcd" g:configDir."/coc/ultisnips"
    exec "FZF!"
endfunction

command! Config call s:OpenConfig()
command! Packages call s:OpenPackages()
command! FileTypes call s:OpenFileTypes()
command! Snippets call s:OpenSnippets()

" ----------------------------- "
"             Term              "
"------------------------------ "

command! Term bo :17sp term://bash
command! Tarm tabnew term://bash

" ----------------------------- "
"              Git              "
"------------------------------ "

command! Done w | :bdelete


" ----------------------------- "
"             Grep              "
"------------------------------ "

command! -nargs=1 JS grep <q-args> -g "**/*.{js,jsx,html}"
command! -nargs=1 JSON grep <q-args> -g "**/*.json"
command! -nargs=1 TS grep <q-args> -g "**/*.{ts,tsx,html}"
command! -nargs=1 RS grep <q-args> -g "**/*.rs"
command! -nargs=1 ELM grep <q-args> -g "**/*.elm"
command! -nargs=1 STL grep <q-args> -g "**/*.{css,scss,less,sass}"
command! -nargs=1 GO grep <q-args> -g "**/*.go"
command! -nargs=1 GD grep <q-args> -g "**/*.gd"
command! -nargs=1 CS grep <q-args> -g "**/*.{cs,cshtml}"
