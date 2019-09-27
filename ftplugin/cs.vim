autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
nnoremap <buffer> <silent> gd :OmniSharpGotoDefinition<CR>
nnoremap <buffer> gs :OmniSharpFindSymbol<CR>
nnoremap <buffer> <Leader>rn :OmniSharpRename<CR>
nnoremap <buffer> <silent> K :OmniSharpDocumentation<CR>
nnoremap <buffer> gr :OmniSharpFindUsages<CR>
nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>

" autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

" autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
" autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
" autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
" autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

" autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
" autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
