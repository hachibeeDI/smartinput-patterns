let s:save_cpo = &cpo
set cpo&vim


if exists('g:lexima_patterns')
  finish
endif



let g:lexima_patterns = 1

let &cpo = s:save_cpo
unlet s:save_cpo
