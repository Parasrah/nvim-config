if has('nvim') && g:IsLoaded('nvim-lsp')
    lua require'nvim_lsp'.rls.setup{}
endif
