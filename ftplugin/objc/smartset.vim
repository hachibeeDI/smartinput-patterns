
call smartinput#define_rule({
\   'at'       : '^\%#',
\   'char'     : '-',
\   'input'    : '- ()<Left>',
\   'filetype': ['objc', 'objcpp'],
\   })
call smartinput#define_rule({
\   'at'       : '^\%#',
\   'char'     : '+',
\   'input'    : '+ ()<Left>',
\   'filetype': ['objc', 'objcpp'],
\   })

call smartinput#define_rule({
\   'at'       : '[^^]\%#',
\   'char'     : ']',
\   'input'    : '<Esc>bi[<Esc>ea ]<Left>',
\   'filetype': ['objc', 'objcpp'],
\   })
