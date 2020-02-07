let b:ale_linters = { 'typescript': ['eslint'] }

nnoremap <silent> <leader>oi :CocCommand tsserver.organizeImports<CR>
