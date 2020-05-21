if exists("g:gf_loaded")
  finish
endif

let g:gf_loaded = 1

function s:Mkdir()
  let dir = expand('%:p:h')

  if dir =~ '://'
    return
  endif

  if !isdirectory(dir)
    call mkdir(dir, 'p')
    echo 'Created non-existing directory: '.dir
  endif
endfunction

autocmd BufWritePre * call s:Mkdir()

map gf :e <cfile><CR>
