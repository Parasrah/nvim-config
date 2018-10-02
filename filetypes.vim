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

augroup fzf
  au!
  " Fix fzf for terminal ESC mapping
  au FileType fzf tnoremap <buffer> <Esc> <Esc>
augroup end

augroup typescript
  au!
  au FileType typescript call g:IndentTwo()
augroup end

augroup javascript
  au!
  au FileType javascript call g:IndentTwo()
augroup end

augroup vue
  au!
  " TODO: Smart indentation?
  au FileType vue call g:IndentTwo()
augroup end

augroup html
  au!
  au FileType html call g:IndentTwo()
augroup end

augroup json
  au!
  au FileType json call g:IndentTwo()
augroup end

augroup markdown
  au!
  au FileType markdown call g:IndentTwo()
augroup end

augroup css
  au!
  au FileType css call g:IndentTwo()
augroup end

augroup scss
  au!
  au FileType scss call g:IndentTwo()
augroup end

augroup elm
  au!
  au FileType elm call g:IndentFour()
augroup end

augroup rust
  au!
  au FileType rust call g:IndentFour()
  au FileType rust nmap gd <Plug>(rust-def)
augroup end

augroup vim
  au!
  au FileType vim call g:IndentTwo()
augroup end
