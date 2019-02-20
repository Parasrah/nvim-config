function! g:IndentTwo()
  setlocal expandtab
  setlocal shiftwidth=2
  setlocal softtabstop=2
endfunction

function! g:IndentFour()
  setlocal expandtab
  setlocal shiftwidth=4
  setlocal softtabstop=4
endfunction

" Configure plugin
filetype plugin indent on

augroup fzfGroup
  au!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noruler
    \| autocmd BufLeave <buffer> set laststatus=2 ruler
  " Fix fzf for terminal ESC mapping
  au FileType fzf tnoremap <buffer> <Esc> <Esc>
augroup end

augroup typescriptGroup
  au!
  au FileType typescript call g:IndentTwo()
augroup end

augroup javascriptGroup
  au!
  au FileType javascript call g:IndentTwo()
augroup end

augroup vueGroup
  au!
  " TODO: Smart indentation?
  au FileType vue call g:IndentTwo()
augroup end

augroup htmlGroup
  au!
  au FileType html call g:IndentTwo()
augroup end

augroup jsonGroup
  au!
  au FileType json call g:IndentTwo()
augroup end

augroup markdownGroup
  au!
  au FileType markdown call g:IndentTwo()
augroup end

augroup cssGroup
  au!
  au FileType css call g:IndentTwo()
augroup end

augroup scssGroup
  au!
  au FileType scss call g:IndentTwo()
augroup end

augroup elmGroup
  au!
  au FileType elm call g:IndentFour()
augroup end

augroup rustGroup
  au!
  au FileType rust call g:IndentFour()
  au FileType rust nmap gd <Plug>(rust-def)
augroup end

augroup vimGroup
  au!
  au FileType vim call g:IndentTwo()
augroup end

augroup gdscriptGroup
  au!
  au FileType gdscript call g:IndentFour()
augroup end
