# vim-textobj-erb

[![Build Status](https://travis-ci.org/whatyouhide/vim-textobj-erb.svg?branch=master)](https://travis-ci.org/whatyouhide/vim-textobj-erb)

![gif-demonstration][gif]

Just use `iE` for changing <b>i</b>nside an erb tag, and `aE` for changing
<b>a</b>round it (`<%` and `%>` included).

In the gif, I:

- visually select inside the block with `viE`
- change inside another block with `ciE`
- delete around a block with `daE`

`E` is a mnemonic for an erb block. I didn't use `e` (lowercase) since there's a
super useful [vim-textobj-entire](https://github.com/kana/vim-textobj-entire)
which targets the entire buffer and uses `e` as its text object.

This plugin is based on
[kana/vim-textobj-user](https://github.com/kana/vim-textobj-entire) and it
depends on it.

## Installation

I can't stop singing the praises of [vim-plug][vim-plug] as a plugin manager,
but any of them will do.

``` viml
" vim-plug
Plug 'kana/vim-textobj-user'
Plug 'https://github.com/whatyouhide/vim-textobj-erb'
" NeoBundle
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'https://github.com/whatyouhide/vim-textobj-erb'
" Vundle
Plugin 'kana/vim-textobj-user'
Plugin 'https://github.com/whatyouhide/vim-textobj-erb'
```

If you use [pathogen][pathogen], just clone the repository.

```
cd ~/.vim/bundle
git clone https://github.com/kana/vim-textobj-user
git clone https://github.com/whatyouhide/vim-textobj-erb
```


## Contributing

Open an issue if there's something wrong, or submit Pull Requests. I'm more than
happy to get help!


## License

&copy; Andrea Leopardi

[![][wtfpl-logo]][wtfpl]


[vim-plug]: https://github.com/junegunn/vim-plug
[pathogen]: https://github.com/tpope/vim-pathogen
[wtfpl]: http://www.wtfpl.net/
[wtfpl-logo]: http://www.wtfpl.net/wp-content/uploads/2012/12/logo-220x1601.png
[gif]: http://i.imgur.com/Us8dm9T.gif
