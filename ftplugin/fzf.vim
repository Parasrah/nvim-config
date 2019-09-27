set laststatus=0 noruler
autocmd BufLeave <buffer> set laststatus=2 ruler
" Fix fzf for terminal ESC mapping
tnoremap <buffer> <Esc> <Esc>
