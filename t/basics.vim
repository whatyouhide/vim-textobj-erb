runtime! plugin/textobj/erb.vim

function! OutputMultilineTag()
  put = '<%#'
  put = '  Multiline'
  put = '  tag'
  put = '%>'

  " Go back to the first (empty) line and delete it so that there aren't empty
  " lines.
  normal! ggdd
endfunction

function! OutputNestedTag()
  put = '<% test do %>'
  put = '  <%= hello %>'
  put = '<% end %>'

  normal! ggdd
endfunction

function! OutputToFirstLine(str)
  normal! gg
  put! = a:str
endfunction


describe 'erb'
  it 'should set a global variable'
    Expect exists('g:loaded_textobj_erb') == 1
  end
end


describe 'mappings'
  it 'makes the aE and iE mappings available'
    new

    call OutputToFirstLine('<% a tag %>')
    normal diE
    Expect getline(1) == '<%  %>'

    call OutputToFirstLine('<% a tag %>')
    normal daE
    Expect getline(1) == ''

    close!
  end
end


describe 'textobj-erb'
  before
    new
  end

  after
    close!
  end

  it '<Plug>(textobj-erblock-a) selects the entire tag'
    call OutputToFirstLine('<% test %>')
    execute "normal d\<Plug>(textobj-erb-a)"
    Expect getline(1) == ''
  end

  it '<Plug>(textobj-erblock-i) selects inside the tag'
    call OutputToFirstLine('<% test %>')
    execute "normal d\<Plug>(textobj-erb-i)"
    Expect getline(1) == '<%  %>'
  end

  it '<Plug>(textobj-erblock-a) selects the entire whitespace-free tag'
    call OutputToFirstLine('<% test -%>')
    execute "normal d\<Plug>(textobj-erb-a)"
    Expect getline(1) == ''
  end

  it '<Plug>(textobj-erblock-i) selects inside the whitespace-free tag'
    call OutputToFirstLine('<% test -%>')
    execute "normal d\<Plug>(textobj-erb-i)"
    Expect getline(1) == '<%  -%>'
  end

  it '<Plug>(textobj-erblock-a) selects the entire outputting tag'
    call OutputToFirstLine('<%= test %>')
    execute "normal d\<Plug>(textobj-erb-a)"
    Expect getline(1) == ''
  end

  it '<Plug>(textobj-erblock-i) selects inside the outputting tag'
    call OutputToFirstLine('<%= test %>')
    execute "normal d\<Plug>(textobj-erb-i)"
    Expect getline(1) == '<%=  %>'
  end

  it '<Plug>(textobj-erblock-a) selects the entire comment tag'
    call OutputToFirstLine('<%# test %>')
    execute "normal d\<Plug>(textobj-erb-a)"
    Expect getline(1) == ''
  end

  it '<Plug>(textobj-erblock-i) selects inside the comment tag'
    call OutputToFirstLine('<%# test %>')
    execute "normal d\<Plug>(textobj-erb-i)"
    Expect getline(1) == '<%#  %>'
  end

  it '<Plug>(textobj-erblock-a) selects around the non-escaped tag'
    call OutputToFirstLine('<%== Non escaped tag %>')
    execute "normal d\<Plug>(textobj-erb-a)"
    Expect getline(1) == ''
  end

  it '<Plug>(textobj-erblock-i) selects inside the non-escaped tag'
    call OutputToFirstLine('<%== Non escaped tag %>')
    execute "normal d\<Plug>(textobj-erb-i)"
    Expect getline(1) == '<%==  %>'
  end

  it 'handles nested tags'
    call OutputNestedTag()

    normal jfh
    execute "normal d\<Plug>(textobj-erb-i)"
    Expect getline(1) == '<% test do %>'
    Expect getline(2) == '  <%=  %>'
    Expect getline(3) == '<% end %>'
  end

  it '<Plug>(textobj-erblock-a) handles multiline tags'
    call OutputMultilineTag()
    execute "normal d\<Plug>(textobj-erb-a)"

    Expect getline(1) == ''
    Expect getline(2) == ''
    Expect getline(3) == ''
    Expect getline(4) == ''
  end

  it '<Plug>(textobj-erblock-i) handles multiline tags'
    call OutputMultilineTag()
    execute "normal d\<Plug>(textobj-erb-i)"

    Expect getline(1) == '<%#'
    Expect getline(2) == '  '
    Expect getline(3) == '%>'
    Expect getline(4) == ''
  end
end
