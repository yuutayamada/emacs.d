#!/bin/sh

# USER VARIABLES #
# Define emacs
emacs=emacs
emacsclient=emacsclient

# Set this to add extra directory path
: epath:=""

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
  daemon="${emacs} ${d_option} --daemon=${daemon_name}"
  eval "${daemon}" >/dev/null 2>&1
}

EmacsDwim() {
  if ! pgrep emacs >/dev/null 2>&1; then
    EmacsDaemon && EmacsClient $*
  elif jobs -s %TerminalEmacs >/dev/null 2>&1; then
    fg %TerminalEmacs
  elif jobs -s %GUI_Emacs     >/dev/null 2>&1; then
    fg %GUI_Emacs
  elif jobs -s %EmacsClient   >/dev/null 2>&1; then
    fg %EmacsClient
  else
    EmacsClient $*
  fi
}

TerminalEmacs() {
  option="-t" EmacsDwim $*
}

GUI_Emacs() {
  option="-c" EmacsDwim $*
}

XtermEmacs() {
  # Use xterm-keybinder.el to use C-M prefix keys on xterm.
  xtermopt=`ghq root`/github.com/yuutayamada/emacs.d/elisp/self/xterm-keybinder-el/xterm-option \
          TerminalEmacs $*
}

urxvtEmacs() {
  urxvt_client=`ghq root`/github.com/yuutayamada/emacs.d/elisp/self/xterm-keybinder-el/emacs-urxvt-client \
              TerminalEmacs $*
}

EmacsClient() {
  [ -z "$*" ] && where="$PWD" || where="$*"
  client=(${emacsclient} -s ${daemon_name} -q ${option} ${where})
  if [ -z $xtermopt ] && [ -z $urxvt_client ]; then
    ${client} &
  elif test -z $xtermopt && test -n $urxvt_client; then
    # Emacsclient on URxvt
    ${urxvt_client} \
      -depth 32 -bg rgba:0000/0000/0000/a777 \
      -xrm 'URxvt*perl-ext:' \
      -xrm 'URxvt*perl-ext-common:' \
      -title "urxvtEmacs" \
      -keysym.C-0x5b 'string:@a' \
      -e ${client} \
      > /dev/null 2>&1 &
  else
    # Emacsclient on XTerm
    iconName=XtermEmacs
    eval "xterm -j -s -samename -xrm `${xtermopt}` -T ${iconName} -e \"${client}\" &"
  fi
}

# GUI Emacs
alias e='GUI_Emacs'
# Terminal Emacs
alias t='TerminalEmacs'
# emacsclient on xterm
alias c='XtermEmacs'
# emacsclient on urxvt
alias u='urxvtEmacs'
# boot only daemon
alias ed='EmacsDaemon &'

# For emergency
alias baymax="${emacs} -q -D &"
