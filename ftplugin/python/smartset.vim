
" classとかの定義時に:までを入れる
call smartinput#define_rule({
\   'at'       : '^\s*\%(\<def\>\|\<if\>\|\<for\>\|\<while\>\|\<class\>\|\<with\>\)\s*\w\+.*\%#',
\   'char'     : '(',
\   'input'    : '():<Left><Left>',
\   'filetype' : ['python'],
\   })
" が、すでに:がある場合は重複させない. (smartinputでは、atの定義が長いほど適用の優先度が高くなる)
call smartinput#define_rule({
\   'at'       : '^\s*\%(\<def\>\|\<if\>\|\<for\>\|\<while\>\|\<class\>\|\<with\>\)\s*\w\+.*\%#.*:',
\   'char'     : '(',
\   'input'    : '()<Left>',
\   'filetype' : ['python'],
\   })

call smartinput#define_rule({
\   'at'       : '^\s*\%(\<def\>\|\<if\>\|\<for\>\|\<while\>\|\<class\>\|\<with\>\)\s*\w\+.*\%#:$',
\   'char'     : ':',
\   'input'    : '<Right><CR>',
\   'filetype' : ['python'],
\   })
call smartinput#define_rule({
\   'at'       : '^\s*\%(\<def\>\|\<if\>\|\<for\>\|\<while\>\|\<class\>\|\<with\>\)\s*\w\+.*\%#:$',
\   'char'     : '<CR>',
\   'input'    : '<Right><CR>',
\   'filetype' : ['python'],
\   })
" 辞書の宣言なことが明らかなケースではsmartchrを呼び出す
call smartinput#define_rule({
\   'at'       : '{.\+\%#',
\   'char'     : ':',
\   'input'    : "<C-R>=smartchr#loop(': ', ':')<CR>",
\   'filetype' : ['python'],
\   })
" docstringとかのsphinx形式のアレ
call smartinput#define_rule({
\   'at'       : '^\s*\%#',
\   'char'     : ':',
\   'input'    : "::<Left>",
\   'syntax'   : ["Constant"],
\   'filetype' : ['python'],
\   })
call smartinput#define_rule({
\   'at'       : '^\s*:\%#:',
\   'char'     : '<BS>',
\   'input'    : "<BS><Del>",
\   'syntax'   : ["Constant"],
\   'filetype' : ['python'],
\   })
call smartinput#define_rule({
\   'at'       : '^\s*:.*\%#:',
\   'char'     : ':',
\   'input'    : '<Right>',
\   'syntax'   : ["Constant"],
\   'filetype' : ['python'],
\   })
