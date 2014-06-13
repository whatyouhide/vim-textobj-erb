runtime! plugin/textobj/erb.vim

function! OutputMultilineTag()
  put = '<%#'
  put = '  Multiline'
  put = '  tag'
  put = '%>'

  " Go back to the first (empty) line and delete it so that there aren't empty
  " lines.
  normal gg
  normal dd
endfunction

describe 'erb'
  it 'should set a global variable'
    Expect exists('g:loaded_textobj_erb') == 1
  end
end

describe 'Regular tags'
  before
    new
  end

  after
    close!
  end

  it '<Plug>(textobj-erblock-a) selects the entire tag'
    put! = '<% test %>'
    execute "normal d\<Plug>(textobj-erb-a)"
    Expect getline(1) == ''
  end

  it '<Plug>(textobj-erblock-a) selects inside the whitespace-free tag'
    put! = '<% test -%>'
    execute "normal d\<Plug>(textobj-erb-i)"
    Expect getline(1) == '<%  -%>'
  end

  it '<Plug>(textobj-erblock-a) selects inside the tag'
    put! = '<% test %>'
    execute "normal d\<Plug>(textobj-erb-i)"
    Expect getline(1) == '<%  %>'
  end

  it '<Plug>(textobj-erblock-a) selects the entire whitespace-free tag'
    put! = '<% test -%>'
    execute "normal d\<Plug>(textobj-erb-a)"
    Expect getline(1) == ''
  end

  it '<Plug>(textobj-erblock-a) selects inside the outputting tag'
    put! = '<%= test %>'
    execute "normal d\<Plug>(textobj-erb-i)"
    Expect getline(1) == '<%=  %>'
  end

  it '<Plug>(textobj-erblock-a) selects the entire outputting tag'
    put! = '<%= test %>'
    execute "normal d\<Plug>(textobj-erb-a)"
    Expect getline(1) == ''
  end

  it '<Plug>(textobj-erblock-a) selects inside the comment tag'
    put! = '<%# test %>'
    execute "normal d\<Plug>(textobj-erb-i)"
    Expect getline(1) == '<%#  %>'
  end

  it '<Plug>(textobj-erblock-a) selects the entire comment tag'
    put! = '<%# test %>'
    execute "normal d\<Plug>(textobj-erb-a)"
    Expect getline(1) == ''
  end

  it 'handles nested tags'
    put! = '<% end %>'
    put! = '  <%= hello %>'
    put! = '<% test do %>'

    normal 2Gfh
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
