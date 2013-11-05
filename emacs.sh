#!/bin/bash

# Put your Emacs
emacs="emacs"
emacsclient="emacsclient"
epath=$(cd `dirname $0`; pwd)/.emacs/

if test -z $EMACSLOADPATH; then
  # Define load path for this repository
  export EMACSLOADPATH="${epath}:"
fi

alias baymax="${emacs} -l '${epath}init' &"

## Note ##
# DO NOT use -F option to above aliases. They will occur error.
# Please use ~/.Xresources instead.
# http://www.gnu.org/software/emacs/manual/html_node/emacs/Resources.html#Resources

frameParam="((font . \"Ricty 12\"))"
applyTheme="(my/apply-color-theme)"
daemon="--daemon -Q -l \"${epath}init\""
function GUIEmacs() {
  if ! pgrep emacs; then
    emacs --daemon -Q -l ${epath}init -bg "black" -fg "white" && \
      emacsclient  -F $frameParam -c --eval $applyTheme $@ &
  else
    emacsclient -F $frameParam -c --eval $applyTheme $@ &
  fi
}

alias e="GUIEmacs"

function TerminalEmacs() {
  if ! pgrep emacs; then
    emacs --daemon -Q -l ${epath}init && \
      emacsclient -F $frameParam -t --eval $applyTheme $@
  else
    emacsclient -F $frameParam -t --eval $applyTheme $@
  fi
}

alias t="TerminalEmacs"

# OK(emacs daemon): -bg black
# NG(emacsclient): -F frameParam, but it can change font.

# Old alias
# # GUI Emacs
# alias e="${emacsclient} -a '' -c  ${@} &"
# # Terminal Emacs
# alias t="${emacsclient} -a '' -nw ${@}"
# For rescue
