" -- Keymaps -- "

" -- Common -- "

" -- Terminal

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
  autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
endif

" -- Window Management
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l

if has('nvim')
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
endif

" -- Remove highlighting
nnoremap <silent> <esc> :noh<cr><esc>

" -- Location list navigation
nnoremap <silent> <C-h> :lprevious<CR>
nnoremap <silent> <C-l> :lnext<CR>

" -- Quickfix navigation
nnoremap <silent> <C-j> :cnext<CR>
nnoremap <silent> <C-k> :cprevious<CR>

" -- NeoVim -- "
if !exists("g:gui_oni")

  " Ale linting
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)

  " Rust

  " Deoplete
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

  " Fuzzy File Search
  nnoremap <C-p> :<C-u>FZF<CR>

  " Language client
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
  nnoremap <silent> <C-K> :call LanguageClient#textDocument_codeAction()<CR>
endif


" -- Oni -- "
if exists("g:gui_oni")


endif
