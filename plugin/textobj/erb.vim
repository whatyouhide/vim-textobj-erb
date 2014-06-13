if exists('g:loaded_textobj_erb')
  finish
endif

let s:regex_whitespace = '\(\s\|\n\)*'

call textobj#user#plugin('erb', {
\   '-': {
\     'pattern': ['<%\(-\|=\|#\)\?' . s:regex_whitespace, s:regex_whitespace . '\-\?%>'],
\     'select-a': 'aE',
\     'select-i': 'iE'
\   },
\ })

let g:loaded_textobj_erb = 1
