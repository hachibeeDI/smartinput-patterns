
" its in examples in smartinput. insert #{} in a string literal.
call smartinput#define_rule({
\   'at': '\%#',
\   'char': '#',
\   'input': '#{}<Left>',
\   'filetype': ['ruby'],
\   'syntax': ['Constant', 'Special'],
\ })

" add bar(`|`) in smartinput definitions and define input rule. {{{
call smartinput#define_rule({
\   'at': '\%#',
\   'char': '<Bar>',
\   'input': '<Bar><Bar><Left>',
\   'filetype': ['ruby'],
\ })
call smartinput#define_rule({
\   'at': '|\%#|',
\   'char': '<BS>',
\   'input': '<BS><Del>',
\   'filetype': ['ruby'],
\ })
"}}}

" insert <bar> on both side of block argsments.
call smartinput#define_rule({
\   'at': '\({\|\<do\>\)\s*\%#',
\   'char': '<Bar>',
\   'input': '<Bar><Bar><Left>',
\   'filetype': ['ruby'],
\ })
