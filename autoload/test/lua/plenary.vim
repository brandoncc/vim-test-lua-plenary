" Returns true if the given file belongs to your test runner
if !exists('g:test#lua#plenary#file_pattern')
  let g:test#lua#plenary#file_pattern = '\v_spec\.lua$'
endif

function! test#lua#plenary#test_file(file) abort
  return a:file =~# g:test#lua#plenary#file_pattern
endfunction

" Returns test runner's arguments which will run the current file and/or line
function! test#lua#plenary#build_position(type, position)
  return ["--headless", "-c 'PlenaryBustedFile " . a:position['file'] . "'"]
endfunction

" Returns processed args (if you need to do any processing)
function! test#lua#plenary#build_args(args)
  return a:args
endfunction

" Returns the executable of your test runner
function! test#lua#plenary#executable()
  return "nvim"
endfunction
