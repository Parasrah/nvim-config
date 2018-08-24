" Exit if we are in Oni
if exists("g:gui_oni")
  finish
endif

" -- Themes
let g:onedark_terminal_italics = 1
syntax on
colorscheme onedark

" Keymappings
" -- Deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" -- Typescript
"  TODO: Create function for this
autocmd FileType typescript nnoremap <buffer> <silent> K :TSType<CR>
autocmd FileType typescriptreact nnoremap <buffer> <silent> K :TSType<CR>
autocmd FileType javascript nnoremap <buffer> <silent> K :TSType<CR>
autocmd FileType javascriptreact nnoremap <buffer> <silent> K :TSType<CR>

" -- Ale linting
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" -- Fuzzy File Search
nnoremap <C-p> :<C-u>FZF<CR>

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline_theme='onedark'

" Fuzzy Search
let $FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"'

" Ale
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_completion_enabled = 0
" TODO: Move into ftplugin files
" ex: let b:ale_fixers = ['eslint']
let g:ale_linters = { 'typescript': ['tslint'], 'javascript': ['eslint'] }

" NeoVim Typescript
let g:nvim_typescript#javascript_support = 1
let g:nvim_typescript#default_mappings = 0

" Javascript
let g:javascript_plugin_jsdoc = 1

" YouCompleteMe
let g:ycm_filetype_blacklist = { 'javascript': 1, 'typescript': 1 }

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:echodoc#enable_at_startup = 1

" Workspace
autocmd VimEnter * set noshowmode

" -- End --
