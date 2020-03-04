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
"             Emmet             "
" ----------------------------- "

imap <C-j>, <plug>(emmet-expand-abbr)
imap <C-j>; <plug>(emmet-expand-word)
imap <C-j>u <plug>(emmet-update-tag)
imap <C-j>d <plug>(emmet-balance-tag-inward)
imap <C-j>D <plug>(emmet-balance-tag-outward)
imap <C-j>n <plug>(emmet-move-next)
imap <C-j>N <plug>(emmet-move-prev)
imap <C-j>i <plug>(emmet-image-size)
imap <C-j>/ <plug>(emmet-toggle-comment)
imap <C-j>j <plug>(emmet-split-join-tag)
imap <C-j>k <plug>(emmet-remove-tag)
imap <C-j>a <plug>(emmet-anchorize-url)
imap <C-j>A <plug>(emmet-anchorize-summary)
imap <C-j>m <plug>(emmet-merge-lines)
imap <C-j>c <plug>(emmet-code-pretty)

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

" ------------------------------ "

" Location list navigation
nnoremap <silent> <C-h> :cprevious<cr>
nnoremap <silent> <C-l> :cnext<cr>

" -- Quickfix navigation
nnoremap <silent> <C-k> :lprevious<cr>
nnoremap <silent> <C-j> :lnext<cr>

" -- Insert Spaces
nnoremap <silent> <leader><leader> i<space><right><esc>

" Fuzzy File Search
if g:IsLoaded('fzf-preview.vim')
    nnoremap <silent> <C-p> :<C-u>FzfPreviewFromResources git<cr>
elseif g:IsLoaded('fzf')
    nnoremap <silent> <C-p> :<C-u>FZF<cr>
endif

" ----------------------------- "
"              CoC              "
"------------------------------ "

if g:IsLoaded('coc.nvim')
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
    nnoremap <silent> <leader>go  :<C-u>CocList outline<cr>
    " goto workspace symbol
    nnoremap <silent> gs  :<C-u>CocList -I symbols<cr>

    " Remap for rename current word
    nmap <silent> <leader>rn <Plug>(coc-rename)

    " Remap for format selected region
    vmap <silent> <leader>fo <Plug>(coc-format-selected)
    nmap <silent> <leader>fo <Plug>(coc-format)

    " Code Action
    vmap <silent> <leader>. <Plug>(coc-codeaction-selected)
    nmap <silent> <leader>. <Plug>(coc-codeaction)

    " Quickfix
    nmap <silent> <leader>fi <Plug>(coc-fix-current)

    " Documentation
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
endif
