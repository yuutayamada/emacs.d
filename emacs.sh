#!/bin/bash

# Define emacs
emacs="emacs"
emacsclient="emacsclient"
daemon_name="GNU"

# You may specify frame parameters at .Xresources as well.
## Note ##
# http://www.gnu.org/software/emacs/manual/html_node/emacs/Resources.html#Resources
fParam="((font . \"Ricty 12\"))"

epath=$(cd `dirname $0`; pwd)/.emacs/

# This EMACSLOADPATH env was introduced from Emacs 24.4, so please check your
# Emacs version whether you have higher emacs than the version.
if test -z $EMACSLOADPATH; then
  # Define load path for this repository
  export EMACSLOADPATH="${epath}:"
fi

function EmacsDaemon() {
  daemon="${emacs} --daemon=${daemon_name} -Q -l ${epath}init"
  eval "${daemon}" >/dev/null 2>&1
}

function EmacsDwim() {
  if ! pgrep emacs >/dev/null 2>&1; then
    EmacsDaemon && EmacsClient $@
  elif jobs -s %terminalEmacs >/dev/null 2>&1; then
    fg %terminalEmacs
  elif jobs -s %GUI_Emacs     >/dev/null 2>&1; then
    fg %GUI_Emacs
  elif jobs -s %EmacsClient   >/dev/null 2>&1; then
    fg %EmacsClient
  else
    EmacsClient $@
  fi
}

function terminalEmacs() {
  option="-t" background="" EmacsDwim $@
}

function GUI_Emacs() {
  option="-c" background="&" EmacsDwim $@
}

function EmacsClient() {
  color="TERM=xterm-256color"
  client="${color} ${emacsclient} -F '${fParam}' -s ${daemon_name} ${option} $@ ${background}"
  eval "${client}"
}

# GUI Emacs
alias e='GUI_Emacs'
# Terminal Emacs
alias t='terminalEmacs'
# For emergency
alias baymax="${emacs} -l '${epath}init' &"
