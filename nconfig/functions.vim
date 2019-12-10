" ----------------------------- "
"          Environment          "
"------------------------------ "

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


" ----------------------------- "
"             Search            "
"------------------------------ "

let s:searchGroups = {
\ "web": ["js", "jsx", "ts", "tsx", "json", "html", "scss", "sass", "css", "less", "cs", "cshtml"],
\ "rust": ["rs"],
\ "elm": ["elm"],
\ "golang": ["go"],
\ "elixir": [],
\ "haskell": ["hs"]
\ }

function! g:Search(term)
    let l:currGroup = []
    for l:group in values(s:searchGroups)
        for l:ext in l:group
            if l:ext == &filetype
                let l:currGroup = l:group
                break
            endif
        endfor
    endfor
    let l:files = "**/*.{"
                \ . join(l:currGroup, ",")
                \ . "}"
    exec "grep " . shellescape(a:term) . ' -g "' . l:files . '"'
endfunction

" temp

function! s:crawl(currentDir, extension)
    echom "crawling ".a:currentDir
    if empty(globpath(a:currentDir, "*.".a:extension)) == 0
        return a:currentDir
    endif
    if a:currentDir == "/" || a:currentDir == "C:\\"
        echoerr "could not find ".a:extension
        return ""
    endif
    let upDir = simplify(a:currentDir."/..")
    return s:crawl(upDir, a:extension)
endfunction

function! g:Find(extension)
    let bufferDirectory = fnamemodify(resolve(expand('%:p')), ':h')
    return s:crawl(bufferDirectory, a:extension)
endfunction

" ----------------------------- "
"          Indentation          "
"------------------------------ "

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

" ----------------------------- "
"              Fzf              "
"------------------------------ "

function! g:FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 1,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
