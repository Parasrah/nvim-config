" linter
let b:ale_linters = {'cs': ['OmniSharp']}

" echodoc
call echodoc#enable()
autocmd BufLeave call echodoc#disable()

autocmd CursorHold <buffer> call OmniSharp#TypeLookupWithoutDocumentation()
nnoremap <buffer> <silent> gd :OmniSharpGotoDefinition<CR>
nnoremap <buffer> <silent> gs :OmniSharpFindSymbol<CR>
nnoremap <buffer> <silent> <leader>rn :OmniSharpRename<CR>
nnoremap <buffer> <silent> K :OmniSharpDocumentation<CR>
nnoremap <buffer> <silent> gr :OmniSharpFindUsages<CR>
nnoremap <buffer> <silent> <leader>gi :OmniSharpFindImplementations<CR>

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <buffer> <silent> <leader><Space> :OmniSharpGetCodeActions<CR>
" Quickfix usings
nnoremap <buffer> <silent> <leader>qf :OmniSharpFixUsings<CR>
" Run code actions with text selected in visual mode to extract method
vnoremap <buffer> <silent> <leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>
