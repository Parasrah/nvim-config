let b:ale_linters = { 'typescriptreact': ['eslint'] }
let b:ale_fixers = { 'typescriptreact': ['remove_trailing_lines', 'trim_whitespace', 'prettier'] }

setlocal makeprg=tsc\ --noEmit
setlocal errorformat=%+A\ %#%f\ %#(%l\\\,%c):\ %m,%C%m

setlocal commentstring=//\ %s

nnoremap <silent> <leader>oi :CocCommand tsserver.organizeImports<CR>
