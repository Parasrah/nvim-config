let b:ale_linters = { 'typescript': ['eslint'] }
let b:ale_fixers = { 'typescript': ['remove_trailing_lines', 'trim_whitespace', 'prettier'] }

setlocal commentstring=//\ %s

if g:IsLoaded('nvim-lsp')
    lua require'lsp.tsserver'
    lua require'nvim_lsp'.tsserver.setup{}
elseif g:IsLoaded('coc.nvim')
    nnoremap <silent> <leader>oi :CocCommand tsserver.organizeImports<CR>
endif
