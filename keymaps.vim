" -- Keymaps -- "

" Ale linting
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Fuzzy File Search
nnoremap <C-p> :<C-u>FZF<CR>

" -- Window Management
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

" -- Remove highlighting
nnoremap <silent> <esc> :noh<cr><esc>

" Workspace
autocmd VimEnter * set noshowmode

" -- Typescript
autocmd FileType typescript nnoremap <buffer> <silent> K :TSType<CR>
autocmd FileType typescriptreact nnoremap <buffer> <silent> K :TSType<CR>
autocmd FileType javascript nnoremap <buffer> <silent> K :TSType<CR>
autocmd FileType javascriptreact nnoremap <buffer> <silent> K :TSType<CR>

" -- Deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
