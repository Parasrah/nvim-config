set laststatus=0 noruler showtabline=0
autocmd BufLeave <buffer> set laststatus=2 ruler showtabline=2
" Fix fzf for terminal ESC mapping
tnoremap <buffer> <Esc> <Esc>
