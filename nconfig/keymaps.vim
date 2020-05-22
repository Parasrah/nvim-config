" General
nnoremap Y y$

" <esc>
tnoremap <leader>[ <C-\><C-n>

" ----------------------------- "
"          Window Swap          "
" ----------------------------- "

nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>

" ----------------------------- "
"          ex commands          "
" ----------------------------- "

cnoremap <expr> <C-P> wildmenumode() ? "\<C-P>" : "\<Up>"
cnoremap <expr> <C-N> wildmenumode() ? "\<C-N>" : "\<Down>"

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

" -- Quickfix navigation
nnoremap <silent> <C-h> :cprevious<cr>
nnoremap <silent> <C-l> :cnext<cr>

" Fuzzy File Search
if g:IsLoaded('fzf-preview.vim')
    nnoremap <silent> <C-p> :<C-u>FzfPreviewFromResources git<cr>
elseif g:IsLoaded('fzf')
    nnoremap <silent> <C-p> :<C-u>FZF<cr>
endif

" ----------------------------- "
"          navigation           "
"------------------------------ "

nnoremap <silent> <leader>l $
vnoremap <silent> <leader>l $
onoremap <silent> <leader>l $
nnoremap <silent> <leader>h ^
vnoremap <silent> <leader>h ^
onoremap <silent> <leader>h ^

" ----------------------------- "
"              git              "
"------------------------------ "

nnoremap <silent> <leader>gb :<C-u>Gblame<cr>
nnoremap <silent> <leader>gd :<C-u>Gdiffsplit!<cr>
nnoremap <silent> <leader>gm :<C-u>Git mergetool<cr>
nnoremap <silent> <leader>gl :<C-u>0Gclog<cr>
nnoremap <silent> <leader>gf :<C-u>Git fetch<cr>
nnoremap <silent> <leader>gps :<C-u>Git push<cr>
nnoremap <silent> <leader>gpl :<C-u>Git pull<cr>
nnoremap <silent> <leader>gs :<C-u>G<cr>
nnoremap <silent> <leader>g? :<C-u>Help fugitive<cr>
nnoremap <silent> <leader>gw :<C-u>Gwrite<cr>

" ----------------------------- "
"         Remap Defaults        "
"------------------------------ "

" TODO: carry count through to operation
nnoremap <silent> <leader>i gi
nnoremap <silent> <leader>o go
nnoremap <silent> <leader>s gs

" ----------------------------- "
"             Linting           "
" ----------------------------- "

if g:IsLoaded('ale')
    nmap <silent> <C-j> <Plug>(ale_next)
    nmap <silent> <C-k> <Plug>(ale_previous)
    nmap <silent> <leader>fo <Plug>(ale_fix)
elseif
    nnoremap <silent> <C-k> :lprevious<cr>
    nnoremap <silent> <C-j> :lnext<cr>
endif

" ----------------------------- "
"          Autocomplete         "
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
elseif has('nvim')
    set omnifunc=v:lua.vim.lsp.omnifunc
    nnoremap <silent> gd        <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <silent> gD        <cmd>lua vim.lsp.buf.declaration()<CR>
    nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <silent> gi        <cmd>lua vim.lsp.buf.implementation()<CR>
    nnoremap <silent> <c-k>     <cmd>lua vim.lsp.buf.signature_help()<CR>
    " nnoremap <silent> 1gD       <cmd>lua vim.lsp.buf.type_definition()<CR>
    nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap <silent> gs        <cmd>lua vim.lsp.buf.document_symbol()<CR>
    inoremap <silent> <c-space> <c-x><c-o>
endif
