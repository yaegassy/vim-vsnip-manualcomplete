if (exists('g:loaded_vsnip_manualcomplete'))
  finish
endif
let g:loaded_vsnip_manualcomplete = 1

let s:save_cpo = &cpo
set cpo&vim

inoremap <silent> <Plug>(vsnip-manualcomplete) <C-r>=vsnip_manualcomplete#complete()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
