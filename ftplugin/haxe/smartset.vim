
" synIDattr(synID(line('.'), col('.'), 0), 'name') == 'haxeSString' ? '${}<Left>' : '$' みたいにしたい
call smartinput#define_rule({
\   'at': '\%#',
\   'char': '$',
\   'input': '${}<Left>',
\   'filetype': ['haxe'],
\   'syntax': ['Constant'],
\ })
" ダブルコーテーションの時はsmartしないように(応急処置)
call smartinput#define_rule({
\   'at': '\".*\%#',
\   'char': '$',
\   'input': '$',
\   'filetype': ['haxe'],
\   'syntax': ['Constant'],
\ })
