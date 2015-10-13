
" css have only a comment style '/* */'
call lexima#add_rule({
\   'at': '/\%#',
\   'char': '/',
\   'input': '*<Space><Space>*/<Left><Left><Left>',
\   'filetype': ['css'],
\ })
