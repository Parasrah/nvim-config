" -- Settings -- "

" -- Common -- "

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

function! s:SetupTheme()
  syntax on
  colorscheme onedark
endfunction

if !exists("g:gui_oni")
  " -- NeoVim -- "
  " True Colors
  "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
  "If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
  "(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif

  " Themes
  let g:onedark_terminal_italics = 1
  call s:SetupTheme()

  " Default indentation
  set expandtab
  set shiftwidth=4
  set softtabstop=4

  " File plugin
  filetype plugin indent on

  " Line numbers
  set number

  " Sign column
  set signcolumn=yes

  " Workspace
  autocmd VimEnter * set noshowmode

  " Language Client
  set hidden
  let g:LanguageClient_hoverPreview = 'Always'
  let g:LanguageClient_serverCommands = {
  \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
  \ 'javascript': ['javascript-typescript-stdio'],
  \ 'typescript': ['typescript-language-server', '--stdio'],
  \ 'python': [],
  \ 'elm': [],
  \ 'vue': ['vls'],
  \}
  " 'typescript': ['javascript-typescript-stdio'],

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
  let g:airline_theme='onedark'

  " Ale
  let g:ale_sign_error = '✗'
  let g:ale_sign_warning = '⚠'
  let g:ale_completion_enabled = 0
  " TODO: Move into ftplugin files
  " ex: let b:ale_fixers = ['eslint']
  let g:ale_linters = { 'typescript': ['tslint'], 'javascript': ['eslint'] }

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
