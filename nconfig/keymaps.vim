" General
nnoremap Y y$

" Use esc to exit terminal mode
tnoremap <esc> <C-\><C-n>
tnoremap <C-v><esc> <esc>

" ----------------------------- "
"           Surround            "
" ----------------------------- "

" TODO: get this working
" nmap yS ys$

" ----------------------------- "
"          Window Swap          "
" ----------------------------- "

nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>

" ----------------------------- "
"             Escape            "
" ----------------------------- "

function! s:NormalEscape()
    return ":nohls\<cr>\<esc>"
endfunction

noremap <silent><expr> <esc> <SID>NormalEscape()

" TODO: make esc remove popup item <C-e>

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

" goto definition
nmap <silent> gd <Plug>(coc-definition)
" goto type definition
nmap <silent> gy <Plug>(coc-type-definition)
" goto reference
nmap <silent> gr <Plug>(coc-references)
" goto implementation
nmap <silent> <leader>gi <Plug>(coc-implementation)
" goto document symbol
nnoremap <silent> go  :<C-u>CocList outline<cr>
" goto workspace symbol
nnoremap <silent> gs  :<C-u>CocList -I symbols<cr>

" Remap for rename current word
nmap <silent> <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <silent> <leader>f <Plug>(coc-format-selected)
nmap <silent> <leader>f <Plug>(coc-format)

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
