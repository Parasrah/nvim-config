" -- Settings -- "

" -- Common -- "

set hidden
set linebreak

" shortmess
set shortmess=cfilnxtToOI

" modeline
set modelines=5

" Command completion
set wildmode=longest,list,full
set wildmenu

" Hack for nvr
if has('nvim')
  if !exists("g:gui_oni")
    let $NVIM_TERMINAL = 1
  endif
  let $VISUAL = 'nvr -cc vsplit --remote-wait'
endif

" Macro trick https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Vimgrep
set wildignore=node_modules/**,elm-stuff/**,.git/**,build/**,dist/**,*.temp

function! s:ThemeOneDark()
  let g:onedark_terminal_italics = 1
  let g:airline_theme = "onedark"
  syntax on
  colorscheme onedark
endfunction

function! s:ThemeGruvbox()
  let g:airline_theme = 'gruvbox'
  let g:gruvbox_italic = 0
  let g:gruvbox_bold = 1
  let g:gruvbox_underline = 1
  let g:gruvbox_italicize_comments = 0
  set background=dark
  syntax on
  colorscheme gruvbox
endfunction

function! s:ThemeNord()
  let g:airline_theme = 'nord'
  let g:nord_italic = 1
  let g:nord_underline = 1
  let g:nord_italic_comments = 1
  let g:nord_comment_brightness = 12
  syntax on
  colorscheme nord
endfunction

function! s:SetupTheme()
  if (has("termguicolors"))
    set termguicolors
    call s:ThemeGruvbox()
  else
    call s:ThemeOneDark()
  endif
  " setup highlighting
  hi CocErrorFloat ctermfg=LightRed guifg=#fa8072
endfunction

" Grep program
if executable("rg")
  set grepprg=rg\ --vimgrep\ --smart-case\ --no-heading\ --hidden\ -g\ \"!.git\"
endif

" Sign column
set signcolumn=yes

" Ale
let g:ale_lint_on_save = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_completion_enabled = 0
let g:ale_linters = { 'javascript': ['eslint'], 'typescript': ['eslint'] }

" Snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Terminal Only
if !exists("g:gui_oni")
  " Themes
  call s:SetupTheme()

  " Default indentation
  set expandtab
  set shiftwidth=4
  set softtabstop=4

  " Line numbers
  set number

  " Workspace
  autocmd VimEnter * set noshowmode

  " --- CoC --- "

  set completeopt-=preview

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call s:CursorHoldHighlight()
  function! s:CursorHoldHighlight()
    if &ft != 'json'
      call CocActionAsync('highlight')
    endif
  endfunction

  " Use `:Format` for format current buffer
  command! -nargs=0 Format :call CocAction('format')

  " Use `:Fold` for fold current buffer
  command! -nargs=? Fold :call CocAction('fold', <f-args>)

  augroup cocformat
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " -- Delimitmate -- "
  let g:delimitMate_expand_cr = 1
  let g:delimitMate_expand_space = 1

  " --- Elm --- "
  let g:elm_setup_keybindings = 1

  " Airline
  " let g:airline_powerline_fonts=1
  let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#show_splits = 1
  let g:airline#extensions#tabline#show_tabs = 1
  let g:airline#extensions#tabline#show_tab_nr = 0
  let g:airline#extensions#tabline#show_tab_type = 0
  let g:airline#extensions#tabline#show_close_button = 0
  let g:airline#extensions#tabline#formatter = 'jsformatter'

  " Javascript
  let g:javascript_plugin_jsdoc = 1

  " Deoplete
  let g:deoplete#enable_at_startup = 1

  " Fuzzy Search
  let $FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"'
  let g:fzf_layout = { 'window': 'enew' }
endif
