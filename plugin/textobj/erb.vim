if exists('g:loaded_textobj_erb')
  finish
endif

call textobj#user#plugin('erb', {
\   '-': {
\     'pattern': ['<%\(-\|=\|#\)\?\s*', '\s*\-\?%>'],
\     'select-a': 'aE',
\     'select-i': 'iE'
\   },
\ })

let g:loaded_textobj_erb = 1
