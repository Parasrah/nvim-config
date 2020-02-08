let b:ale_linters = { 'typescript': ['eslint'] }

setlocal commentstring=//\ %s

nnoremap <silent> <leader>oi :CocCommand tsserver.organizeImports<CR>
