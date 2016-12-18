"========================================================================
" Vim extra python syntax file
" Language: Python
" Author: Huoty <sudohuoty@gmail.com>
"========================================================================

let python_highlight_all = 1

syn keyword pythonBuiltin __name__
syn keyword pythonExceptions BadRequest

syn keyword pythonThis   cls self
syn match   pythonMember "\(cls\.\|self\.\)\@<=[A-Za-z_]\+\(\.\| \)"

hi link pythonThis    String
hi link pythonMember  Function

"syn keyword customKeywords huoty
hi customKeywords term=bold cterm=bold ctermfg=5
