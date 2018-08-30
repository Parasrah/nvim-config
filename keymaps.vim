" -- Keymaps -- "

" -- Common -- "

" -- Window Management
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

" -- Remove highlighting
nnoremap <silent> <esc> :noh<cr><esc>


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
