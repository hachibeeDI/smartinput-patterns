
" css have only a comment style '/* */'
call smartinput#define_rule({
\   'at': '/\%#',
\   'char': '/',
\   'input': '*<Space><Space>*/<Left><Left><Left>',
\   'filetype': ['css'],
\ })
