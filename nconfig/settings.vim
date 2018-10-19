" -- Settings -- "

" -- Common -- "

" shortmess
set shortmess=filnxtToOI

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

function! s:UseOneDark()
  let g:onedark_terminal_italics = 1
  let g:airline_theme = "onedark"
  syntax on
  colorscheme onedark
endfunction

function! s:UseAyu()
  let ayucolor="dark"
  let g:airline_theme='ayu_mirage'
  syntax on
  colorscheme ayu
endfunction

function! s:UseDracula()
  let g:airline_theme='dracula'
  syntax on
  color dracula
endfunction

function! s:UseGruvbox()
  let g:airline_theme='gruvbox'
  set background=dark
  syntax on
  colorscheme gruvbox
endfunction

function! s:SetupTheme()
  if (has("termguicolors"))
    set termguicolors
    call s:UseGruvbox()
  else
    call s:UseOneDark()
  endif
endfunction

" Grep program
if executable("rg")
  set grepprg=rg\ --vimgrep\ --smart-case\ --no-heading\ --hidden\ -g\ \"!.git\"
endif

" Sign column
set signcolumn=yes

" Ale
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_completion_enabled = 0
let g:ale_linters = { 'typescript': ['tslint'], 'javascript': ['eslint'] }

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsSnippetDirectories=["usnippets"]

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

  " Language Client
  set hidden
  let g:LanguageClient_serverCommands = {
  \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
  \ 'typescript': ['typescript-language-server', '--stdio'],
  \ 'vue': ['vls'],
  \ 'css': ['css-langserver', '--stdio'],
  \ 'scss': ['css-langserver', '--stdio'],
  \ 'html': ['html-langserver', '--stdio'],
  \ 'json': ['json-langserver', '--stdio'],
  \}
  " \ 'javascript': ['javascript-typescript-stdio'],

  " ELm
  let g:elm_setup_keybindings = 1

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

  " Javascript
  let g:javascript_plugin_jsdoc = 1

  " Deoplete
  let g:deoplete#enable_at_startup = 1
  let g:echodoc#enable_at_startup = 1

  " Fuzzy Search
  let $FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"'
endif

" -- Oni -- "
if exists("g:gui_oni")

endif
