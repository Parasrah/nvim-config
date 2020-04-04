" -- Commands -- "

function! s:OpenConfig()
    exec 'tabnew' g:files.settings
    exec 'lcd' g:nestedConfigDir
    exec 'below :vs' g:files.functions
    exec 'below :sp' g:files.keymaps
    wincmd h
    exec 'below :sp' g:files.commands
    wincmd k
endfunction

function! s:OpenPackages()
    exec 'tabnew' g:files.packages
endfunction

function! s:OpenFileTypes()
    exec 'tabnew'
    exec 'lcd' g:configDir.'/ftplugin'
    exec 'FZF!'
endfunction

function! s:OpenSnippets()
    exec 'tabnew'
    exec 'lcd' g:configDir.'/coc/ultisnips'
    exec 'FZF!'
endfunction

function! s:OpenStatus()
    exec 'tabnew' g:files.status
    exec 'lcd' g:nestedConfigDir
endfunction

command! Config call s:OpenConfig()
command! Packages call s:OpenPackages()
command! FileTypes call s:OpenFileTypes()
command! Snippets call s:OpenSnippets()
command! Status call s:OpenStatus()

" ----------------------------- "
"             Help              "
"------------------------------ "

function! s:Help(topic)
    exec 'tabnew +h\ ' . escape(a:topic, ' ')
    wincmd o
endfunction

command! -nargs=1 Help call s:Help(<q-args>)

" ----------------------------- "
"             Term              "
"------------------------------ "

command! Term bo :17sp term://bash
command! Tarm tabnew term://bash

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
command! -nargs=1 CS grep <q-args> -g "**/*.{cs,cshtml,csproj}"
command! -nargs=1 FS grep <q-args> -g "**/*.{fs}"
command! -nargs=1 NIX grep <q-args> -g "**/*.{nix}"
command! -nargs=1 SQL grep <q-args> -g "**/*.{sql}"
command! -nargs=1 ELI grep <q-args> -g "**/*.{ex,esx}"
command! -nargs=1 YAML grep <q-args> -g "**/*.{yml,yaml}"
command! -nargs=1 VIM grep <q-args> -g "**/*.{vim,lua}"
command! -nargs=1 S :call g:Search(<f-args>)
