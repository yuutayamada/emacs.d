[![Build Status](https://travis-ci.org/yuutayamada/emacs.d.png?branch=master)](https://travis-ci.org/yuutayamada/emacs.d)

Configuration for my .emacs

This repository is still work in progress.


## Files and directories description
- .emacs   : my emacs configuration directory
- elisp    : emacs extension directory
- emacs.sh : make aliases to start my emacs

# How to use this repository?

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

