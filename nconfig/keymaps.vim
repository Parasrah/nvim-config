if has('nvim')
  " Use esc to exit terminal mode
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

" -- Window Management
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

" -- Remove highlighting
nnoremap <silent> <esc> :noh<cr><esc>

" -- Location list navigation
nnoremap <silent> <C-h> :lprevious<CR>
nnoremap <silent> <C-l> :lnext<CR>

" -- Quickfix navigation
nnoremap <silent> <C-j> :cnext<CR>
nnoremap <silent> <C-k> :cprevious<CR>

" -- Insert Spaces
nnoremap <space> i<space><right><esc>

" -- NeoVim -- "
if !exists("g:gui_oni")

  " Deoplete
  " inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

  " Fuzzy File Search
  nnoremap <C-p> :<C-u>FZF<CR>

  " Language client
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
  " nnoremap <silent> <C-K> :call LanguageClient#textDocument_codeAction()<CR>
endif


" -- Oni -- "
if exists("g:gui_oni")

endif