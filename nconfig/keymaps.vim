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

imap <silent> <C-j>, <Plug>(emmet-expand-abbr)
imap <silent> <C-j>; <Plug>(emmet-expand-word)
imap <silent> <C-j>u <Plug>(emmet-update-tag)
imap <silent> <C-j>d <Plug>(emmet-balance-tag-inward)
imap <silent> <C-j>D <Plug>(emmet-balance-tag-outward)
imap <silent> <C-j>n <Plug>(emmet-move-next)
imap <silent> <C-j>N <Plug>(emmet-move-prev)
imap <silent> <C-j>i <Plug>(emmet-image-size)
imap <silent> <C-j>/ <Plug>(emmet-toggle-comment)
imap <silent> <C-j>j <Plug>(emmet-split-join-tag)
imap <silent> <C-j>k <Plug>(emmet-remove-tag)
imap <silent> <C-j>a <Plug>(emmet-anchorize-url)
imap <silent> <C-j>A <Plug>(emmet-anchorize-summary)
imap <silent> <C-j>m <Plug>(emmet-merge-lines)
imap <silent> <C-j>c <Plug>(emmet-code-pretty)

" ----------------------------- "
"          Window Swap          "
" ----------------------------- "

nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>

" ----------------------------- "
"              Space            "
" ----------------------------- "

nnoremap <leader>l i<space><esc>l
nnoremap <leader>h hi<space><esc>
nnoremap <leader>j o<esc>
nnoremap <leader>k <S-o><esc>

" ----------------------------- "
"             Escape            "
" ----------------------------- "

function! s:NormalEscape()
    return ":nohls\<cr>\<esc>"
endfunction

noremap <silent><expr> <esc> <SID>NormalEscape()

" ----------------------------- "
"          Star Search          "
"------------------------------ "

" case sensitive * search
nnoremap * /\C\<<C-r>=expand('<cword>')<cr>\><cr>
nnoremap # ?\C\<<C-r>=expand('<cword>')<cr>\><cr>
nnoremap g* /\C<C-r>=expand('<cword>')<cr><cr>
nnoremap g? ?\C<C-r>=expand('<cword>')<cr><cr>

" From http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html

" makes * and # work on visual mode too.
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" recursively vimgrep for word under cursor or selection if you hit leader-star
" TODO: change this to use grep
if maparg('<leader>*', 'n') == ''
  nmap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
endif
if maparg('<leader>*', 'v') == ''
  vmap <leader>* :<C-u>call <SID>VSetSearch()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>
endif

" ------------------------------ "

" Location list navigation
nnoremap <silent> <C-h> :cprevious<cr>
nnoremap <silent> <C-l> :cnext<cr>

" -- Quickfix navigation
nnoremap <silent> <C-k> :lprevious<cr>
nnoremap <silent> <C-j> :lnext<cr>

" Fuzzy File Search
if g:IsLoaded('fzf-preview.vim')
    nnoremap <silent> <C-p> :<C-u>FzfPreviewFromResources git<cr>
elseif g:IsLoaded('fzf')
    nnoremap <silent> <C-p> :<C-u>FZF<cr>
endif

" ----------------------------- "
"              Git              "
"------------------------------ "

nnoremap <silent> <leader>gb :<C-u>Gblame<cr>
nnoremap <silent> <leader>gd :<C-u>Gdiffsplit<cr>
nnoremap <silent> <leader>gm :<C-u>Git mergetool<cr>
nnoremap <silent> <leader>gl :<C-u>0Gclog<cr>
nnoremap <silent> <leader>gf :<C-u>Git fetch<cr>
nnoremap <silent> <leader>gp :<C-u>Git push<cr>
nnoremap <silent> <leader>gs :<C-u>Git status<cr>

" ----------------------------- "
"         Remap Defaults        "
"------------------------------ "

" TODO: carry count through to operation
nnoremap <silent> <leader>i gi
nnoremap <silent> <leader>o go
nnoremap <silent> <leader>s gs

" ----------------------------- "
"              CoC              "
" ----------------------------- "

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
    nmap <silent> gi <Plug>(coc-implementation)
    " goto document symbol
    nnoremap <silent> go  :<C-u>CocList outline<cr>
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
    nmap <silent> <leader>qf <Plug>(coc-fix-current)

    " Documentation
    nnoremap <silent> K :call <SID>show_documentation()<cr>
    function! s:show_documentation()
        if &filetype == 'vim'
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction
endif
