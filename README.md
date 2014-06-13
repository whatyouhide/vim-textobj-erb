# ERB block text object

[![Build Status](https://travis-ci.org/whatyouhide/vim-textobj-erb.svg?branch=master)](https://travis-ci.org/whatyouhide/vim-textobj-erb)

Just use `iE` for changing <b>i</b>nside an erb tag, and `aE` for changing
<b>a</b>round it (`<%` and `%>` included).

`E` is a mnemonic for an erb block. I didn't use `e` (lowercase) since there's a
super useful [vim-textobj-entire](https://github.com/kana/vim-textobj-entire)
which targets the entire buffer and uses `e` as its text object.

This plugin is based on
[kana/vim-textobj-user](https://github.com/kana/vim-textobj-entire) and it
depends on it.

## Installation

The preferred installation method is through
[Vundle](https://github.com/gmarik/Vundle.vim).

Just add this to your plugin list:

```
" vim-textobj-erb depends on kana/vim-textobj-user.
Plugin 'kana/vim-textobj-user'
Plugin 'whatyouhide/vim-textobj-erb'
```

If you want to use [pathogen](https://github.com/tpope/vim-pathogen), just:

```
cd ~/.vim/bundle
git clone git://github.com/kana/vim-textobj-user
git clone git://github.com/whatyouhide/vim-textobj-erb
```

## Contributing

You know how: branch, work, commit, pull request. No need to fork such a small
project.
