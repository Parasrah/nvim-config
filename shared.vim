" Commands
command! Config tabnew $NVIMCONFIG/shared.vim
      \ | :below :sp $NVIMCONFIG/tui.vim
      \ | :below :vs $NVIMCONFIG/gui.vim
      \ | :wincmd k

command! Packages tabnew $NVIMCONFIG/packages.vim
      \ | :below :sp $NVIMCONFIG/packages-tui.vim
      \ | :below :vs $NVIMCONFIG/packages-gui.vim
      \ | :wincmd k

command! Term bo :20sp term://bash
command! Done w | :bdelete

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

" -- Highlight
nnoremap <silent> <esc> :noh<cr><esc>

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

" Hack for nvr
if has('nvim')
  let $NVIM_TERMINAL = 1
  let $VISUAL = 'nvr -cc vsplit --remote-wait'
endif

" Default indentation
set expandtab
set shiftwidth=4
set softtabstop=4

" File plugin
filetype plugin indent on

" Line numbers
set number

" Macro trick https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" ELm
let g:elm_setup_keybindings = 1

" -- End --
