let s:save_cpo = &cpo
set cpo&vim


if exists('g:lexima_patterns')
  finish
endif


" common rules
let s:cstyle_commentable_filetypes =
      \ get(g:, 'cstyle_commentable_filetypes', ['java', 'cpp', 'cs', 'haxe', 'objc', 'javascript', 'typescript', 'go', ])

" lexima for C like style comments {{{
call lexima#add_rule({
\   'at': '/\%#',
\   'char': '/',
\   'input': '/<Space>',
\   'filetype': s:cstyle_commentable_filetypes,
\ })
call lexima#add_rule({
\   'at': '// \%#',
\   'char': '<BS>',
\   'input': '<BS><BS>',
\   'filetype': s:cstyle_commentable_filetypes,
\ })
" multiline compatible
call lexima#add_rule({
\   'at': '// \%#',
\   'char': '/',
\   'input': '<BS><BS>*<Space><Space>*/<Left><Left><Left>',
\   'filetype': s:cstyle_commentable_filetypes,
\ })
call lexima#add_rule({
\   'at': '/\%#',
\   'char': '*',
\   'input': '*<Space><Space>*/<Left><Left><Left>',
\   'filetype': s:cstyle_commentable_filetypes,
\ })
call lexima#add_rule({
\   'at': '/\* \%# \*/',
\   'char': '<BS>',
\   'input': '<BS><BS><Del><Del><Del>',
\   'filetype': s:cstyle_commentable_filetypes,
\ })
" expand like javadoc
call lexima#add_rule({
\   'at': '/\* \%# \*/',
\   'char': '<CR>',
\   'input': '<Del><BS>*<CR><Space>*<CR><Up><End><Space>',
\   'filetype': s:cstyle_commentable_filetypes,
\ })
" append * in multiline comments
call lexima#add_rule({
\   'at': '^\s*\*\s\+.*\%#$',
\   'char': '<CR>',
\   'input': '<CR>*<Space>',
\   'filetype': s:cstyle_commentable_filetypes,
\   'syntax': ['Comment'],
\ })
" }}}


call lexima#add_rule({
\   'at': '\%#',
\   'char': '-',
\   'input': '-',
\   'syntax': ['Comment'],
\   'priority': 999
\ })


let g:lexima_patterns = 1

let &cpo = s:save_cpo
unlet s:save_cpo
