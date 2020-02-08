let b:ale_linters = { 'typescriptreact': ['eslint'] }

setlocal commentstring=//\ %s

nnoremap <silent> <leader>oi :CocCommand tsserver.organizeImports<CR>
