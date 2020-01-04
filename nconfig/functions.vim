" ----------------------------- "
"             Status            "
"------------------------------ "

function! StatusColors()
    return luaeval('require("status").colors()')
endfunction

function! g:SetupStatus()
    let value = luaeval('require("status").get()')
    set statusline=%{StatusColors()}
    exec "set statusline+=" . value
endfunction

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
    " TODO: fallback if float not supported
    let buf = nvim_create_buf(v:false, v:true)
    call setbufvar(buf, '&signcolumn', 'no')

    let height = float2nr(25)
    let width = float2nr(80)
    let row = 1
    let col = float2nr((&columns - width) / 2)

    let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

    call nvim_open_win(buf, v:true, opts)
endfunction

" ----------------------------- "
"            Minpac             "
"------------------------------ "

function! g:AddPackage(info)
    " TODO: write in lua
    if !has_key(a:info, 'repo')
        echoerr "missing package repo (trying to add package)"
        return
    endif
    if !has_key(a:info, 'package')
        echoerr "missing package name (trying to add package)"
        return
    endif
    let repo = a:info.repo
    let package = a:info.package
    let enable = 1
    if has_key(a:info, 'enable')
        let enable = a:info.enable
    endif
    let defaults = {}
    if has_key(a:info, 'config')
        let defaults = extend(defaults, a:info.config)
    endif
    let config = extend(copy(defaults), { 'type': 'opt' })
    if exists('*minpac#init')
	    call minpac#add(repo.'/'.package, config)
    endif
    if l:enable
	exec "packadd! " . package
    endif
endfunction

function! g:IsLoaded(package)
    return &runtimepath =~ a:package
endfunction
