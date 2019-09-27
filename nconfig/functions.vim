" -- Environment

" Detect the current OS (windows/linux/wsl)
function! g:DetectOS()
    if has("win16") || has("win32") || has("win64")
        return 'windows'
    endif
    call system("grep -q Microsoft /proc/version")
    if v:shell_error == 0
        return 'wsl'
    else
        return 'linux'
    endif
endfunction

" -- Indentation

function! g:IndentTwo()
    setlocal expandtab
    setlocal shiftwidth=2
    setlocal softtabstop=2
endfunction

function! g:IndentFour()
    setlocal expandtab
    setlocal shiftwidth=4
    setlocal softtabstop=4
endfunction

function! g:IndentEight()
    setlocal noexpandtab
    setlocal shiftwidth=8
    setlocal softtabstop=8
endfunction
