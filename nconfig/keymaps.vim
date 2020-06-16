" General
nnoremap Y y$

" Use esc to exit terminal mode
tnoremap <esc> <C-\><C-n>
tnoremap <C-v><esc> <esc>

" ----------------------------- "
"          window swap          "
" ----------------------------- "

nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>

" ----------------------------- "
"          ex commands          "
" ----------------------------- "

cnoremap <expr> <C-P> wildmenumode() ? "\<C-P>" : "\<Up>"
cnoremap <expr> <C-N> wildmenumode() ? "\<C-N>" : "\<Down>"

" ----------------------------- "
"             escape            "
" ----------------------------- "

function! s:NormalEscape()
    return ":nohls\<cr>\<esc>"
endfunction

noremap <silent><expr> <esc> <SID>NormalEscape()

" ----------------------------- "
"          star search          "
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

xnoremap * :<c-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<c-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" recursively vimgrep for word under cursor or selection if you hit leader-star
" TODO: change this to use grep
if maparg('<leader>*', 'n') == ''
  nmap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
endif
if maparg('<leader>*', 'v') == ''
  vmap <leader>* :<c-u>call <SID>VSetSearch()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>
endif

" ------------------------------ "

" -- Quickfix navigation
nnoremap <silent> <C-h> :cprevious<cr>
nnoremap <silent> <C-l> :cnext<cr>

" Fuzzy File Search
if g:IsLoaded('fzf')
    nnoremap <silent> <C-p> :<c-u>FZF<cr>
endif

" ----------------------------- "
"              git              "
"------------------------------ "

nnoremap <silent> <leader>gb :<c-u>Gblame<cr>
nnoremap <silent> <leader>gd :<c-u>Gdiffsplit!<cr>
nnoremap <silent> <leader>gm :<c-u>Git mergetool<cr>
nnoremap <silent> <leader>gf :<c-u>Git fetch<cr>
nnoremap <silent> <leader>gps :<c-u>Git push<cr>
nnoremap <silent> <leader>gpl :<c-u>Git pull<cr>
nnoremap <silent> <leader>gs :<c-u>G<cr>
nnoremap <silent> <leader>g? :<c-u>Help fugitive<cr>
nnoremap <silent> <leader>gw :<c-u>Gwrite<cr>
autocmd! BufEnter * if empty(&filetype) | execute 'nnoremap <silent> <leader>gl :<c-u>Gclog! -50<cr>'
autocmd! BufRead,BufNewFile * if !empty(&filetype) | execute 'nnoremap <silent> <leader>gl :<c-u>0Gclog! -20<cr>'

" ----------------------------- "
"         remap defaults        "
"------------------------------ "

nnoremap <silent> <leader>i gi

" ----------------------------- "
"             building          "
" ----------------------------- "

nnoremap <leader>d :<c-u>Dispatch<cr>

" ----------------------------- "
"             linting           "
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
"          autocomplete         "
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
    nnoremap <silent> go  :<c-u>CocList outline<cr>
    " goto workspace symbol
    nnoremap <silent> gs  :<c-u>CocList -I symbols<cr>

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
