command! PackUpdate packadd minpac | source $MYVIMRC | redraw | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

if !exists('*minpac#init')
  " Abstract into another file so loading this makes sense
  finish
endif

call minpac#init({ 'verbose': 0 })

call minpac#add('k-takata/minpac', { 'type': 'opt' })

" General
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
call minpac#add('nelstrom/vim-visual-star-search')

" File Management
call minpac#add('scrooloose/nerdtree')
call minpac#add('junegunn/fzf')

" General Linting/Autocompletion
call minpac#add('valloric/youcompleteme')
call minpac#add('w0rp/ale')

" Themes
call minpac#add('joshdick/onedark.vim', { 'type': 'opt' })

" Interface
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('mhinz/vim-startify')

" Elm
call minpac#add('elmcast/elm-vim')

" Markdown
call minpac#add('tpope/vim-markdown')

" Javascript/Typescript
call minpac#add('mhartington/nvim-typescript', { 'do': './install.sh' })
call minpac#add('Shougo/deoplete.nvim')
call minpac#add('Shougo/denite.nvim')
call minpac#add('pangloss/vim-javascript')
call minpac#add('HerringtonDarkholme/yats.vim')

" -- Configuration --

" Custom commands
command! Config vs ~/.config/nvim/init.vim

" Keymappings
" -- Window Management
nnoremap <silent> <Up> :res +3<CR>
nnoremap <silent> <Down> :res -3<CR>
nnoremap <silent> <Left> :3winc <<CR>
nnoremap <silent> <Right> :3winc ><CR>
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j
" -- Ale linting
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" -- Fuzzy File Search
nnoremap <C-p> :<C-u>FZF<CR>

" Macro trick https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Themes

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
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
endif
let g:onedark_terminal_italics = 1
syntax on
colorscheme onedark
let g:airline_theme='onedark'

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" Ale
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" YouCompleteMe
let g:ycm_filetype_blacklist = { 'javascript': 1, 'typescript': 1 }

" Deopletu
let g:deoplete#enable_at_startup = 1

" File plugin
filetype plugin indent on

" NeoVim Typescript
let g:nvim_typescript#javascript_support = 1

" Javascript
let g:javascript_plugin_jsdoc = 1

" Line numbers
set number

" Startup layout
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd VimEnter * nested split term://bash
autocmd VimEnter * wincmd x 
autocmd VimEnter * res +10

" -- END --

