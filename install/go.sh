#!/bin/sh

if which go >/dev/null 2>&1; then
  ## Code support
  # auto import
  go get -u golang.org/x/tools/cmd/goimports
  # function jump
  go get -u github.com/nsf/gocode
  go get -u code.google.com/p/rog-go/exp/cmd/godef

  ## Other
  # Google Japanese IME with skk server
  go get -u github.com/akiym/go-skkserv
  # fast grep
  go get -u github.com/monochromegane/the_platinum_searcher/...
  # Japanese customized grep
  go get -u github.com/mattn/jvgrep
fi
