#!/bin/sh

set -e

# Reset
EMACSLOADPATH=""

cd `ghq root`/git.savannah.gnu.org/emacs

# TODO: organize prerequisite libraries
# for image
# apt-get install libXaw3d libxpm libpng libz libjpeg libtiff libgif librsvg2-dev
# For webkit: libwebkitgtk-3.0-dev

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

# CONFIGURE
./autogen.sh all
./configure \
  CFLAGS='-O2' \
  --with-dbus -without-toolkit-scroll-bars \
  --with-xim --without-makeinfo --with-x-toolkit=gtk3 \
  --with-modules --with-cairo
# Memo for Emacs 25
# --with-cairo, --with-xwidgets, --with-modules
# (cairo and xwidgets need gtk3)

make -j5
