let b:ale_linters = { 'typescriptreact': ['eslint', 'tslint'] }

nnoremap <silent> <leader>oi :CocCommand tsserver.organizeImports<CR>
