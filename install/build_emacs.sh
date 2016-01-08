#!/bin/sh

set -e

# Reset
EMACSLOADPATH=""

cd `ghq root`/git.savannah.gnu.org/emacs

# TODO: organize prerequisite libraries
# for image
# apt-get install libXaw3d libxpm libpng libz libjpeg libtiff libgif librsvg2-dev

# reset previous things
# discard stuff from last build
git reset --hard HEAD
# delete all of the last build stuff
git clean -xdf

# update to latest
git checkout master
git pull git://git.savannah.gnu.org/emacs.git

# git checkout emacs-25
# git pull

# configure
./autogen.sh
./configure \
  CFLAGS='-O3' \
  --with-x-toolkit=lucid --with-dbus -without-toolkit-scroll-bars \
  --with-xim --without-makeinfo --with-modules

# make or make bootstrap?
make

# memo
# ./configure \
#   CPPFLAGS='-I/foo/myinclude' LDFLAGS='-L/bar/mylib' \
#   CFLAGS='-O3' LIBS='-lfoo -lbar'

# May I change epaths.h?
# The path for finding Lisp files is specified in src/epaths.h,
# a file which is generated by running configure.  To change the path,
# you can edit the definition of PATH_LOADSEARCH in that file
# before you run `make'.
