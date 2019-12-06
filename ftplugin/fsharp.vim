" ----------------------------- "
"         LanguageClient        "
"------------------------------ "

nnoremap <buffer> <silent> K :call fsharp#showTooltip()<cr>
nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<cr>
nnoremap <buffer> <silent> <leader>rn :call LanguageClient#textDocument_rename()<cr>
nnoremap <buffer> <silent> <leader><space> :call LanguageClient#textDocument_codeAction()<cr>
