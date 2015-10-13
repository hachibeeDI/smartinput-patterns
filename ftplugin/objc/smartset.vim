
call lexima#add_rule({
\   'at'       : '^\%#',
\   'char'     : '-',
\   'input'    : '- ()<Left>',
\   'filetype': ['objc', 'objcpp'],
\   })
call lexima#add_rule({
\   'at'       : '^\%#',
\   'char'     : '+',
\   'input'    : '+ ()<Left>',
\   'filetype': ['objc', 'objcpp'],
\   })

call lexima#add_rule({
\   'at'       : '[^^]\%#',
\   'char'     : ']',
\   'input'    : '<Esc>bi[<Esc>ea ]<Left>',
\   'filetype': ['objc', 'objcpp'],
\   })
