if exists('g:autoloaded_vsnip_manualcomplete')
  finish
endif
let g:autoloaded_vsnip_manualcomplete= 1

let s:save_cpo = &cpo
set cpo&vim

function! vsnip_manualcomplete#complete() abort
  let l:word_to_complete = matchstr(strpart(getline('.'), 0, col('.') - 1), '\S\+$')
  let l:from_where = col('.') - len(l:word_to_complete)
  let l:contain_word = 'stridx(v:val.word, l:word_to_complete)>=0'
  let l:candidates = vsnip#get_complete_items(bufnr('%'))
  let l:matches = map(filter(l:candidates, l:contain_word),
    \ "{
    \  'word': v:val.word,
    \  'menu': v:val.kind,
    \  'dup' : 1,
    \ }")

  if !empty(l:matches)
    call complete(l:from_where, l:matches)
  endif
  return ''
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
