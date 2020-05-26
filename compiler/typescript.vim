if exists("current_compiler")
    finish
endif

let current_compiler = "typescript"

" TODO: should discover root dir
CompilerSet makeprg=./node_modules/.bin/tsc\ --noEmit

CompilerSet errorformat=%+A\ %#%f\ %#(%l\\\,%c):\ %m,%C%m
