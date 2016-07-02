[![Build Status](https://travis-ci.org/yuutayamada/emacs.d.png?branch=master)](https://travis-ci.org/yuutayamada/emacs.d)

Configuration for my .emacs

## Files or directories description
- .emacs   : my emacs configuration directory
  - site-start.el : this file will be loaded at first in my whole elisp files
  - Y : my chunk of init files
  - default.el : this file will be loaded after other user init files
    (like .emacs)
- elisp : emacs extension directory
  - el-get : el-get packages
  - self : my own packages (but will be merged el-get directory on the future)
  - package : package.el's packages

- emacs.sh : make aliases to start my Emacs

# How to use this repository?
(I don't make sure yet, so might not work...)

```sh
emacsscript="path/to/this-repository/emacs.sh"
epath="/.emacs/" source ${emacsscript}
emacs
```

## Change frame parameter
You can set like this:
```sh
EMACS_FRAME_PARAMETERS=$(cat <<'END_HEREDOC'
  (font . "Inconsolata 12")
  (background-color . "black")
END_HEREDOC
)
```

