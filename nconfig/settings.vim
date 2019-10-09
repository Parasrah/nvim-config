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
set wildignore=node_modules/**,elm-stuff/**,.git/**,build/**,dist/**,*.temp

" Enable filetype plugin
filetype plugin indent on

" Workspace
autocmd VimEnter * set noshowmode

" ----------------------------- "
"             Grep              "
"------------------------------ "

if executable("rg")
    set grepprg=rg\ --vimgrep\ --smart-case\ --no-heading\ --hidden\ -g\ \"!.git\"
endif

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
let g:ale_linters = { 'javascript': ['eslint'], 'typescript': ['tslint'], 'cs': ['OmniSharp'] }

" ----------------------------- "
"              CoC              "
"------------------------------ "

" options
let g:coc_snippet_next = '<tab>'

" status line
let g:airline#extensions#coc#enabled = 1

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

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#formatter = 'jsformatter'
if g:DetectOS() == 'linux'
    let g:airline_powerline_fonts = 1
    let g:airline_symbols_ascii = 0
else
    let g:airline_symbols_ascii = 1
    let g:airline_powerline_fonts = 0
endif

" ----------------------------- "
"              Elm              "
"------------------------------ "

let g:elm_setup_keybindings = 1

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

call s:SetupTheme()
