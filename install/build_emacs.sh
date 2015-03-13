#!/bin/sh

# Font, bg, fg or etc.
if test -f ~/.Xresouces; then
  xrdb ~/.Xresouces
fi

# reset previous things
make clean
git reset --hard HEAD

# update
git pull git://git.savannah.gnu.org/emacs.git

# configure
./autogen.sh
./configure --with-x-toolkit=lucid --with-dbus

# make
make bootstrap && make

