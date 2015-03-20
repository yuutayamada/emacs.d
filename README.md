[![Build Status](https://travis-ci.org/yuutayamada/emacs.d.png?branch=master)](https://travis-ci.org/yuutayamada/emacs.d)

configuration for my emacs, and elisp.

This repository is still work in progress.

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

