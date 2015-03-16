if exists('g:smartinput_patterns')
  finish
endif


call smartinput#map_to_trigger('i', '<CR>', '<CR>', '<CR>')
call smartinput#map_to_trigger('i', '#', '#', '#')
call smartinput#map_to_trigger('i', ':', ':', ':')
call smartinput#map_to_trigger('i', '/', '/', '/')
call smartinput#map_to_trigger('i', '*', '\*', '\*')
call smartinput#map_to_trigger('i', '%', '%', '%')


" common rules
let s:cstyle_commentable_filetypes =
      \ get(g:, 'cstyle_commentable_filetypes', ['java', 'cpp', 'cs', 'haxe', 'objc', 'javascript', 'typescript', 'go', ])

" smartinput for C like style comments {{{
call smartinput#define_rule({
\   'at': '/\%#',
\   'char': '/',
\   'input': '/<Space>',
\   'filetype': s:cstyle_commentable_filetypes,
\ })
call smartinput#define_rule({
\   'at': '// \%#',
\   'char': '<BS>',
\   'input': '<BS><BS>',
\   'filetype': s:cstyle_commentable_filetypes,
\ })
" multiline compatible
call smartinput#define_rule({
\   'at': '// \%#',
\   'char': '/',
\   'input': '<BS><BS>*<Space><Space>*/<Left><Left><Left>',
\   'filetype': s:cstyle_commentable_filetypes,
\ })
call smartinput#define_rule({
\   'at': '/\%#',
\   'char': '*',
\   'input': '*<Space><Space>*/<Left><Left><Left>',
\   'filetype': s:cstyle_commentable_filetypes,
\ })
call smartinput#define_rule({
\   'at': '/\* \%# \*/',
\   'char': '<BS>',
\   'input': '<BS><BS><Del><Del><Del>',
\   'filetype': s:cstyle_commentable_filetypes,
\ })
" expand like javadoc
call smartinput#define_rule({
\   'at': '/\* \%# \*/',
\   'char': '<CR>',
\   'input': '<Del><BS>*<CR><Space>*<CR><Up><End><Space>',
\   'filetype': s:cstyle_commentable_filetypes,
\ })
" append * in multiline comments
call smartinput#define_rule({
\   'at': '^\s*\*\s\+.*\%#$',
\   'char': '<CR>',
\   'input': '<CR>*<Space>',
\   'filetype': s:cstyle_commentable_filetypes,
\   'syntax': ['Comment'],
\ })
" }}}



let g:smartinput_patterns = 1
