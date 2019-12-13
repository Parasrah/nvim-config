let b:ale_linters = { 'typescript': ['eslint', 'tslint'] }

nnoremap <silent> <leader>oi :CocCommand tsserver.organizeImports<CR>
