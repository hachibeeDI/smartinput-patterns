
" its in examples in lexima. insert #{} in a string literal.
call lexima#add_rule({
\   'at': '\%#',
\   'char': '#',
\   'input': '#{}<Left>',
\   'filetype': ['ruby'],
\   'syntax': ['Constant', 'Special'],
\ })

" add bar(`|`) in lexima definitions and define input rule. {{{
call lexima#add_rule({
\   'at': '\%#',
\   'char': '<Bar>',
\   'input': '<Bar><Bar><Left>',
\   'filetype': ['ruby'],
\ })
call lexima#add_rule({
\   'at': '|\%#|',
\   'char': '<BS>',
\   'input': '<BS><Del>',
\   'filetype': ['ruby'],
\ })
"}}}

" insert <bar> on both side of block argsments.
call lexima#add_rule({
\   'at': '\({\|\<do\>\)\s*\%#',
\   'char': '<Bar>',
\   'input': '<Bar><Bar><Left>',
\   'filetype': ['ruby'],
\ })
