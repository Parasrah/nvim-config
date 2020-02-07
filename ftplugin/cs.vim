" ale
let b:ale_linters = { 'cs': ['OmniSharp'] }

" omnisharp (override coc-nvim)
if exists("g:OmniSharp_loaded")
    " echodoc
    call echodoc#enable()
    autocmd BufLeave call echodoc#disable()

    nmap <buffer> <silent>
                \ gd
                \ <Plug>(omnisharp_go_to_definition)

    nmap <buffer> <silent>
                \ go
                \ <Plug>(omnisharp_find_members)

    nmap <buffer> <silent>
                \ gs
                \ <Plug>(omnisharp_find_symbols)

    nmap <buffer> <silent>
                \ <leader>rn
                \ <Plug>(omnisharp_rename)

    nmap <buffer> <silent>
                \ K
                \ <Plug>(omnisharp_documentation)

    nmap <buffer> <silent>
                \ gr
                \ <Plug>(omnisharp_find_usages)

    nmap <buffer> <silent>
                \ <leader>gi
                \ <Plug>(omnisharp_find_implementations)

    nmap <buffer> <silent>
                \ <leader><Space>
                \ <Plug>(omnisharp_code_actions)

    nmap <buffer> <silent>
                \ <leader>qf
                \ <Plug>(omnisharp_fix_usings)

    vnoremap <buffer> <silent>
                \ <leader><Space>
                \ :call OmniSharp#GetCodeActions('visual')<CR>
endif
