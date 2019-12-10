" ale
let b:ale_linters = ['OmniSharp']

" echodoc
call echodoc#enable()
autocmd BufLeave call echodoc#disable()

" omnisharp (override coc-nvim)
nnoremap <buffer> <silent>
            \ gd
            \ <Plug>(omnisharp_go_to_definition)

nnoremap <buffer> <silent>
            \ go
            \ <Plug>(omnisharp_find_members)

nnoremap <buffer> <silent>
            \ gs
            \ <Plug>(omnisharp_find_symbols)

nnoremap <buffer> <silent>
            \ <leader>rn
            \ <Plug>(omnisharp_rename)

nnoremap <buffer> <silent>
            \ K
            \ <Plug>(omnisharp_documentation)

nnoremap <buffer> <silent>
            \ gr
            \ <Plug>(omnisharp_find_usages)

nnoremap <buffer> <silent>
            \ <leader>gi
            \ <Plug>(omnisharp_find_implementations)

nnoremap <buffer> <silent>
            \ <leader><Space>
            \ <Plug>(omnisharp_code_actions)

nnoremap <buffer> <silent>
            \ <leader>qf
            \ <Plug>(omnisharp_fix_usings)

vnoremap <buffer> <silent>
            \ <leader><Space>
            \ :call OmniSharp#GetCodeActions('visual')<CR>
