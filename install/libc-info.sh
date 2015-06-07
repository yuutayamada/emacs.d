#!/bin/bash
if test -z $XDG_CACHE_HOME/emacs; then
  echo "$XDG_CACHE_HOME/emacs didn't find."
else
  mkdir -p $XDG_CACHE_HOME/emacs/info && \
    cd $XDG_CACHE_HOME/emacs/info && \
    wget http://www.gnu.org/software/libc/manual/info/libc-info.tar.gz && \
    tar xvzf ./libc-info.tar.gz && \
    ginstall-info libc.info dir && \
    rm -fr ./libc-info.tar.gz ./trash
fi

