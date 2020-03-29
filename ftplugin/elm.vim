let b:ale_linters = { 'elm': ['elm_ls'] }
let b:ale_elm_format_use_global = 0
setlocal comments=:--
setlocal commentstring=--\ %s

if has('nvim') && g:IsLoaded('nvim-lsp')
    lua require'nvim_lsp'.elmls.setup{}
endif
