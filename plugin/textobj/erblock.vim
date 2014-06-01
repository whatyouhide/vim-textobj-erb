if exists('g:loaded_textobj_erblock')
  finish
endif

call textobj#user#plugin('erb', {
\   'tag': {
\     'pattern': ['<%\(-\|=\|#\)\?\s\?', '\s\?-\?%>'],
\     'select-a': 'a%',
\     'select-i': 'i%'
\   },
\ })

let g:loaded_textobj_erblock = 1
