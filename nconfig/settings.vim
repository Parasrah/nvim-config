set hidden
set linebreak
set shortmess=cfilnxtToOI
set modelines=5
set updatetime=300
set wildmode=longest,list,full
set wildmenu
set completeopt-=preview
set signcolumn=yes
set nobackup
set nowritebackup
set expandtab
set shiftwidth=4
set softtabstop=4
set number
set wildignore=node_modules/**,elm-stuff/**,.git/**,build/**,dist/**,*.temp,obj/**,bin/**

" Enable filetype plugin
filetype plugin indent on

" Workspace
autocmd VimEnter * set noshowmode

" ----------------------------- "
"             Grep              "
"------------------------------ "

if executable("rg")
    set grepprg=rg\ --vimgrep\ --smart-case\ --no-heading\ --hidden
endif

" ----------------------------- "
"          Delimitmate          "
"------------------------------ "

let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" ----------------------------- "
"              Ale              "
"------------------------------ "

" let g:ale_lint_on_save = 1
if g:DetectOS() == 'linux' || g:DetectOS() == 'wsl'
    let g:ale_sign_error = '✗'
    let g:ale_sign_warning = '⚠'
else
    let g:ale_sign_error = '>>'
    let g:ale_sign_warning = '--'
endif
let g:ale_completion_enabled = 0
let g:ale_linters_explicit = 1
let g:ale_linters = {}

" ----------------------------- "
"          Editorconfig         "
"------------------------------ "

let g:EditorConfig_max_line_indicator = "none"
" These rules cause another save...
let g:EditorConfig_disable_rules = ['insert_final_newline', 'trim_trailing_whitespace']

" ----------------------------- "
"              CoC              "
"------------------------------ "

" extensions
let g:coc_global_extensions = [
\ 'coc-tsserver',
\ 'coc-json',
\ 'coc-snippets',
\ ]

" options
let g:coc_snippet_next = '<tab>'

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

" ----------------------------- "
"         Language Client       "
"------------------------------ "

" fsharp will inject server command, don't want to
" load for anything else
let g:LanguageClient_serverCommands = {}

let g:LanguageClient_diagnosticsList = 'Location'

" ----------------------------- "
"            Ionide             "
"------------------------------ "

let g:fsharp#show_signature_on_cursor_move = 0

let g:fsharp#workspace_mode_peek_deep_level = 2

" ----------------------------- "
"           OmniSharp           "
"------------------------------ "

let g:OmniSharp_server_stdio = 1
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_open_quickfix = 1
let g:OmniSharp_highlight_types = 2
if g:DetectOS() == 'wsl'
    let g:OmniSharp_translate_cygwin_wsl = 1
    let g:OmniSharp_server_path = '/mnt/c/OmniSharp/omnisharp-win-x64/OmniSharp.exe'
endif

" ----------------------------- "
"            Airline            "
"------------------------------ "

" try

" general
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
if g:DetectOS() == 'linux'
    let g:airline_powerline_fonts = 1
    let g:airline_symbols_ascii = 0
else
    let g:airline_symbols_ascii = 1
    let g:airline_powerline_fonts = 0
endif
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_exclude_preview = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
let g:airline_right_sep = ''
let g:airline_left_sep = ''
let g:airline_symbols.dirty = '⚡'
function! AirlineInit()
    let g:airline_section_z = airline#section#create(['linenr'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" extensions
let g:airline_extensions = [
\ 'branch',
\ 'ale',
\ 'tabline',
\ ]

" tabline
" TODO: check if in extensions
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'

" catch
"     echo 'airline not installed'
" endtry


" ----------------------------- "
"           Javascript          "
"------------------------------ "

let g:javascript_plugin_jsdoc = 1

" ----------------------------- "
"              Fzf              "
"------------------------------ "

let $FZF_DEFAULT_OPTS='--layout=reverse'
let $FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"'
let g:fzf_layout = { 'window': 'call g:FloatingFZF()' }

" ----------------------------- "
"            Echodoc            "
"------------------------------ "

let g:echodoc#enable_at_startup = 0
let g:echodoc#type = 'floating'

" ----------------------------- "
"              Nvr              "
"------------------------------ "

if has('nvim')
    let $VISUAL = 'nvr -cc vsplit --remote-wait'
endif

" ----------------------------- "
"            Macros             "
"------------------------------ "

" Macro trick https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

" ----------------------------- "
"            Themes             "
"------------------------------ "

function! s:ThemeOneDark()
    let g:onedark_terminal_italics = 1
    let g:airline_theme = "onedark"
    syntax on
    colorscheme onedark
endfunction

function! s:ThemeGruvbox()
    let g:airline_theme = 'gruvbox'
    let g:gruvbox_italic = 0
    let g:gruvbox_bold = 0
    let g:gruvbox_underline = 0
    let g:gruvbox_italicize_comments = 0
    let g:gruvbox_italicize_strings = 0
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

call s:SetupTheme()
