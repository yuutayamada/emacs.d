#!/bin/bash

# Define emacs
emacs="emacs"
emacsclient="emacsclient"

# You may specify frame parameters at .Xresources as well.
## Note ##
# http://www.gnu.org/software/emacs/manual/html_node/emacs/Resources.html#Resources
frameParam="((font . \"Ricty 12\"))"

epath=$(cd `dirname $0`; pwd)/.emacs/

if test -z $EMACSLOADPATH; then
  # Define load path for this repository
  export EMACSLOADPATH="${epath}:"
fi

function EmacsDwim() {
  color="TERM=xterm-256color"
  daemon="${emacs} --daemon -Q -l ${epath}init"
  client="${color} ${emacsclient} -F '${frameParam}' ${option} $@ ${background}"
  if ! pgrep emacs > /dev/null; then
    eval "${daemon} && ${client}"
  else
    eval "${client}"
  fi
}

# GUI Emacs
alias e='option="-c" background="&" EmacsDwim'
# Terminal Emacs
alias t='option="-t" background="" EmacsDwim'
# For emergency
alias baymax="${emacs} -l '${epath}init' &"
