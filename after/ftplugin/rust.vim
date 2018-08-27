" Fix for racer
" TODO: Remove me after updating racer to 1.29
augroup ToggleDeoplete
  autocmd!
  autocmd BufEnter * call deoplete#disable()
  autocmd BufLeave * call deoplete#enable()
augroup END
