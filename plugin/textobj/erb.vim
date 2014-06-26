" Don't reload the plugin if it has already been loaded.
if exists('g:loaded_textobj_erb')
  finish
endif


" Define some regexes.
let s:whitespace = '\(\s\|\n\)*'
let s:left_modifiers = '\(-\|=\{1,2}\|#\)\?'
let s:right_modifiers = '\-\?'

let s:left = '<%' . s:left_modifiers . s:whitespace
let s:right = s:whitespace . s:right_modifiers . '%>'


" Define the plugin.
call textobj#user#plugin('erb', {
\   '-': {
\     'pattern': [s:left, s:right],
\     'select-a': 'aE',
\     'select-i': 'iE'
\   },
\ })


" Signal that the erb textobj is loaded.
let g:loaded_textobj_erb = 1
