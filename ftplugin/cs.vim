" echodoc
call echodoc#enable()
autocmd BufLeave call echodoc#disable()

" TODO: stop this from overriding ale
" autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
nnoremap <buffer> <silent> gd :OmniSharpGotoDefinition<CR>
nnoremap <buffer> gs :OmniSharpFindSymbol<CR>
nnoremap <buffer> <Leader>rn :OmniSharpRename<CR>
nnoremap <buffer> <silent> K :OmniSharpDocumentation<CR>
nnoremap <buffer> gr :OmniSharpFindUsages<CR>
nnoremap <buffer> <Leader>gi :OmniSharpFindImplementations<CR>

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

" autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
" autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
" autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
" autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

" autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
" autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
