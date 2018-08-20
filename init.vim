command! PackUpdate packadd minpac | source $NVIMCONFIG/init.vim | redraw | call minpac#update()
command! PackClean  packadd minpac | source $NVIMCONFIG/init.vim | call minpac#clean()

source $NVIMCONFIG/packages.vim

" For a paranoia.
" Normally `:set nocp` is not needed, because it is done automatically
" when .vimrc is found.
if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

" -- Configuration --

" Add Packages
packadd! onedark.vim
packadd! nvim-typescript

" Custom commands
command! Config e $NVIMCONFIG/init.vim
command! Packages e $NVIMCONFIG/packages.vim

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

" -- True Colors --
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

" -- Themes
let g:onedark_terminal_italics = 1
syntax on
colorscheme onedark
let g:airline_theme='onedark'

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" Fuzzy Search
let $FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"'

" Ale
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_completion_enabled = 0

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

