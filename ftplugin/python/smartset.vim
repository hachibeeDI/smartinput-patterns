let s:save_cpo = &cpo
set cpo&vim

if exists('g:lexima_patterns__python')
  finish
endif




" classとかの定義時に:までを入れる
call lexima#add_rule({
\   'at'       : '^\s*\%(\<def\>\|\<if\>\|\<for\>\|\<while\>\|\<class\>\|\<with\>\)\s*\w\+.*\%#',
\   'char'     : '(',
\   'input'    : '():<Left><Left>',
\   'filetype' : ['python'],
\   })
" が、すでに:がある場合は重複させない. (leximaでは、atの定義が長いほど適用の優先度が高くなる)
call lexima#add_rule({
\   'at'       : '^\s*\%(\<def\>\|\<if\>\|\<for\>\|\<while\>\|\<class\>\|\<with\>\)\s*\w\+.*\%#.*:',
\   'char'     : '(',
\   'input'    : '()<Left>',
\   'filetype' : ['python'],
\   })

call lexima#add_rule({
\   'at'       : '^\s*\%(\<def\>\|\<if\>\|\<for\>\|\<while\>\|\<class\>\|\<with\>\)\s*\w\+.*\%#:$',
\   'char'     : ':',
\   'input'    : '<Right><CR>',
\   'filetype' : ['python'],
\   })
call lexima#add_rule({
\   'at'       : '^\s*\%(\<def\>\|\<if\>\|\<for\>\|\<while\>\|\<class\>\|\<with\>\)\s*\w\+.*\%#:$',
\   'char'     : '<CR>',
\   'input'    : '<Right><CR>',
\   'filetype' : ['python'],
\   })
call lexima#add_rule({
\   'at'       : '^\s*\%(\<def\>\|\<if\>\|\<for\>\|\<while\>\|\<class\>\|\<with\>\)\s*\w\+.*\%#):$',
\   'char'     : '<CR>',
\   'input'    : '<End><CR>',
\   'filetype' : ['python'],
\   })
" 辞書の宣言なことが明らかなケースではsmartchrを呼び出す
call lexima#add_rule({
\   'at'       : '{.\+\%#',
\   'char'     : ':',
\   'input'    : "<C-R>=smartchr#loop(': ', ':')<CR>",
\   'filetype' : ['python'],
\   })
" docstringとかのsphinx形式のアレ
call lexima#add_rule({
\   'at'       : '^\s*\%#',
\   'char'     : ':',
\   'input'    : "::<Left>",
\   'syntax'   : ["Constant"],
\   'filetype' : ['python'],
\   })
call lexima#add_rule({
\   'at'       : '^\s*:\%#:',
\   'char'     : '<BS>',
\   'input'    : "<BS><Del>",
\   'syntax'   : ["Constant"],
\   'filetype' : ['python'],
\   })
call lexima#add_rule({
\   'at'       : '^\s*:.*\%#:',
\   'char'     : ':',
\   'input'    : '<Right>',
\   'syntax'   : ["Constant"],
\   'filetype' : ['python'],
\   })


call g:lexima#add_rule({
\   'at': '^\s*from\%#',
\   'char': '<Space>',
\   'input': '<Space><C-x><C-o>',
\   'filetype': 'python',
\ })
call g:lexima#add_rule({
\   'at': '^\s*from\s.\+ import\%#',
\   'char': '<Space>',
\   'input': '<Space><C-x><C-o>',
\   'filetype': 'python',
\ })
call g:lexima#add_rule({
\   'at': '^\s*import\%#',
\   'char': '<Space>',
\   'input': '<Space><C-x><C-o>',
\   'filetype': 'python',
\ })




let g:lexima_patterns__python = 1

let &cpo = s:save_cpo
unlet s:save_cpo
