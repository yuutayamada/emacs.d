[![Build Status](https://travis-ci.org/yuutayamada/emacs.d.png?branch=master)](https://travis-ci.org/yuutayamada/emacs.d)

configuration for my emacs, and elisp.

This repository is still work in progress.

# How to use this repository?

You can boot emacs as daemon in below configuration.(I'm configuring at .zlogin)
Please change the file path of emacs and this file accordingly.

```sh
emacs="${HOME}/local/vcs/git.savannah.gnu.org/emacs/src/emacs"
emacsscript="$HOME/local/vcs/github.com/yuutayamada/emacs.d/emacs.sh"
if test -f $emacs && test -f $emacsscript; then
  source ${emacsscript}
  if ! pgrep emacs > /dev/null; then
    EmacsDaemon
  fi
fi
```
