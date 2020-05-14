if has('nvim') && g:IsLoaded('nvim-lsp')
    lua require'lsp.fsharp'
    lua require'nvim_lsp'.fsharp.setup{}
endif
