#!/bin/sh

# USER VARIABLES #
# Define emacs
emacs="emacs"
emacsclient="emacsclient"

# Set this to add extra directory path
: epath:=""
# frame parameter
: ${EMACS_FRAME_PARAMETERS:=""}

epath_default=$(cd `dirname $0`; pwd)
Epath="${epath_default}${epath}"

# daemon name
daemon_name="GNU"

# Daemon option
# I wouldn't use -Q option because I couldn't find the way to set `initial-major-mode'.
# To work around it, I'm using site-start.el file.
d_option="--no-site-lisp --no-splash"

# This EMACSLOADPATH env was introduced from Emacs 24.4, so please check your
# Emacs version whether you have higher emacs than the version.
if test -z $EMACSLOADPATH; then
  # Define load path for this repository
  export EMACSLOADPATH="${Epath}:"
fi

EmacsDaemon () {
  # memo
  # emacs --xrm "emacs.Background: light green"
  daemon="${emacs} ${d_option} --daemon=${daemon_name}"
  eval "${daemon}" >/dev/null 2>&1
}

EmacsDwim() {
  if ! pgrep emacs >/dev/null 2>&1; then
    EmacsDaemon && EmacsClient $@
  elif jobs -s %TerminalEmacs >/dev/null 2>&1; then
    fg %TerminalEmacs
  elif jobs -s %GUI_Emacs     >/dev/null 2>&1; then
    fg %GUI_Emacs
  elif jobs -s %EmacsClient   >/dev/null 2>&1; then
    fg %EmacsClient
  else
    EmacsClient $@
  fi
}

TerminalEmacs() {
  option="-t" background="" EmacsDwim $@
}

GUI_Emacs() {
  option="-c" background="&" EmacsDwim $@
}

XtermEmacs() {
  xtermopt=`ghq root`/github.com/yuutayamada/emacs.d/elisp/self/xterm-keybinder-el/xterm-option TerminalEmacs
}

EmacsClient() {
  [ ! -z ${EMACS_FRAME_PARAMETERS} ] && fparam="-F '(${EMACS_FRAME_PARAMETERS})'"
  [ -z "$@" ] && where=`pwd` || where="$@"
  client="${emacsclient} ${fparam} -s ${daemon_name} -q ${option} ${where}"
  if test -z $xtermopt; then
    eval "${client} ${background}"
  else
    eval "xterm -xrm `${xtermopt}` -e \"export EMACSLOADPATH='${Epath}:' && ${client}\" &"
  fi
}

# GUI Emacs
alias e='GUI_Emacs'
# Terminal Emacs
alias t='TerminalEmacs'
# emacsclient on xterm
alias c='XtermEmacs'
# boot only daemon
alias ed='EmacsDaemon &'

# For emergency
alias baymax="${emacs} -q -D &"
