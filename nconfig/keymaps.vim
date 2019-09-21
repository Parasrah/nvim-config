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
nnoremap <silent> <esc> :noh<CR><ESC>

" -- Location list navigation
nnoremap <silent> <C-h> :cprevious<CR>
nnoremap <silent> <C-l> :cnext<CR>

" -- Quickfix navigation
nnoremap <silent> <C-j> :lprevious<CR>
nnoremap <silent> <C-k> :lnext<CR>

" -- Insert Spaces
nnoremap <space> i<space><right><ESC>

" -- OmniSharp
"  TODO: move to filetypes?
"  * open new tab
"  * lcd to filetypes folder
"  * open fuzzy finder

" -- NeoVim -- "
if !exists("g:gui_oni")

  " Fuzzy File Search
  nnoremap <C-p> :<C-u>FZF<CR>

  " CoC
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  " TODO: Don't overwrite gi
  " nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Remap for format selected region
  vmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  vmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Use K for show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if &filetype == 'vim'
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction
endif
