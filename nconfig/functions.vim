" ----------------------------- "
"              Lua              "
"------------------------------ "

function g:Test()
    try
        call luaeval("require'tests.util'()")
    catch
        if v:exception != ""
            echoerr v:exception
        endif
    endtry
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

function! g:IsTUI()
    if exists('g:vscode')
        return 0
    endif
    return 1
endfunction

" ----------------------------- "
"             Search            "
"------------------------------ "

let s:searchGroups = {
\ 'web': ['js', 'jsx', 'ts', 'tsx', 'json', 'html', 'scss', 'sass', 'css', 'less'],
\ 'cs': ['cs', 'cshtml'],
\ 'rust': ['rs'],
\ 'elm': ['elm'],
\ 'golang': ['go'],
\ 'elixir': ['ex', 'exs'],
\ 'haskell': ['hs']
\ }

function! g:Search(term)
    let l:currGroup = s:searchGroups.elm
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
"            Minpac             "
" ----------------------------- "

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
