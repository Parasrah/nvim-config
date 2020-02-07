let b:ale_linters = { 'typescriptreact': ['eslint'] }

nnoremap <silent> <leader>oi :CocCommand tsserver.organizeImports<CR>
