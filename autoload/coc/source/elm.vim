function! coc#source#elm#init() abort
  return {
  \ 'shortcut': 'foo',
  \ 'priority': 3,
  \ 'filetypes': ['elm'],
  \}
endfunction


function! coc#source#elm#complete(opt, cb) abort
  let items = [{
        \ "word": "foo",
        \}, {
        \ "word": "bar",
        \}]
  call a:cb(items)
endfunction
