" General
nnoremap Y y$

" Use esc to exit terminal mode
tnoremap <esc> <C-\><C-n>
tnoremap <C-v><esc> <esc>

" ----------------------------- "
"             Escape            "
" ----------------------------- "

function! s:NormalEscape()
    return ":nohls\<cr>\<esc>"
endfunction

" Remove highlighting & close floating windows
noremap <silent><expr> <esc> <SID>NormalEscape()

" ------------------------------ "

" Location list navigation
nnoremap <silent> <C-h> :cprevious<cr>
nnoremap <silent> <C-l> :cnext<cr>

" -- Quickfix navigation
nnoremap <silent> <C-k> :lprevious<cr>
nnoremap <silent> <C-j> :lnext<cr>

" -- Insert Spaces
nnoremap <space> i<space><right><esc>

" Fuzzy File Search
nnoremap <C-p> :<C-u>FZF<cr>

" ----------------------------- "
"              CoC              "
"------------------------------ "

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>gi <Plug>(coc-implementation)

" Remap for rename current word
nmap <silent> <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <silent> <leader>f <Plug>(coc-format-selected)
nmap <silent> <leader>f <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <silent> <leader><space> <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <silent> <leader><space> <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <silent> <leader>qf <Plug>(coc-fix-current)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<cr>

function! s:show_documentation()
    if &filetype == 'vim'
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<tab>" :
      \ coc#refresh()
inoremap <expr><S-tab> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
