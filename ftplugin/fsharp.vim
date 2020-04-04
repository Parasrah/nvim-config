if has('nvim') && g:IsLoaded('nvim-lsp')
    lua require'fsharp'
    lua require'nvim_lsp'.fsharp.setup{}
endif
