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

  " Shortcuts for denite interface
  " TODO: Change from space
  " Show extension list
  " nnoremap <silent> <space>e  :<C-u>Denite coc-extension<cr>
  " " Show symbols of current buffer
  " nnoremap <silent> <space>o  :<C-u>Denite coc-symbols<cr>
  " " Search symbols of current workspace
  " nnoremap <silent> <space>t  :<C-u>Denite coc-workspace<cr>
  " " Show diagnostics of current workspace
  " nnoremap <silent> <space>a  :<C-u>Denite coc-diagnostic<cr>
  " " Show available commands
  " nnoremap <silent> <space>c  :<C-u>Denite coc-command<cr>
  " " Show available services
  " nnoremap <silent> <space>s  :<C-u>Denite coc-service<cr>
  " " Show links of current buffer
  " nnoremap <silent> <space>l  :<C-u>Denite coc-link<cr>
endif

" -- Oni -- "
if exists("g:gui_oni")

endif
