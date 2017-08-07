#!/bin/sh

set -e

# Reset
EMACSLOADPATH=""

cd `ghq root`/git.savannah.gnu.org/emacs

# TODO: organize prerequisite libraries
# for image
# apt-get install libXaw3d libxpm libpng libz libjpeg libtiff libgif librsvg2-dev
# gnutls
# For webkit: libwebkitgtk-3.0-dev



# reset previous things
# discard stuff from last build
git reset --hard HEAD
# delete all of the last build stuff
git clean -xdf

# update to latest
# Use specific point to prevent segfault of Emacs
git checkout 9df49cd
git pull git://git.savannah.gnu.org/emacs.git

# git checkout emacs-25
# git pull

# use an X toolkit (KIT one of: yes or gtk, gtk2, gtk3, lucid or athena, motif, no)
toolkit=--with-x-toolkit=lucid
experimental=--with-xwidgets --with-x-toolkit=gtk3 --with-cairo

# CONFIGURE
./autogen.sh all
./configure \
  CFLAGS='-O2' \
  --with-dbus -without-toolkit-scroll-bars \
  --with-xim --without-makeinfo --with-modules\
  $toolkit

# Memo for Emacs 25
# --with-cairo, --with-xwidgets, --with-modules
# (cairo and xwidgets need gtk3)

make -j5
