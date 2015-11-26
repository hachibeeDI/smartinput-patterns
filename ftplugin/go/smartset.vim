let s:save_cpo = &cpo
set cpo&vim

if exists('g:lexima_patterns__go')
  finish
endif


call lexima#add_rule({
\   'at': '<\%#',
\   'char': '-',
\   'input': '-<Space>',
\   'filetype': ['go'],
\ })
call lexima#add_rule({
\   'at': '< \%#',
\   'char': '-',
\   'input': '<BS>-<Space>',
\   'filetype': ['go'],
\ })


call lexima#add_rule({
\   'at': ' - \%#',
\   'char': '>',
\   'input': '<BS>><Space>',
\   'filetype': ['go'],
\ })
call lexima#add_rule({
\   'at': ' -\%#',
\   'char': '->',
\   'input': '><Space>',
\   'filetype': ['go'],
\ })


call lexima#add_rule({
\   'at': '\%#',
\   'char': '*',
\   'input': '*',
\   'filetype': ['go'],
\   'priority': 999,
\ })
call lexima#add_rule({
\   'at': '*\%#',
\   'char': '<Space>',
\   'input': '<Left><Space><Right><Space>',
\   'filetype': ['go'],
\ })



let g:lexima_patterns__go = 1

let &cpo = s:save_cpo
unlet s:save_cpo
