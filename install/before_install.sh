#!/bin/sh


sudo apt-get update -qq
# For magit
sudo apt-get install -y texinfo install-info eblook
# For lookup.el(ndeb)
sudo apt-get install -y eblook
# For copying on terminal (I just like xsel than xclip)
sudo apt-get install -y xsel
# For pdf-tools
sudo apt install -y libpng-dev libz-dev libpoppler-glib-dev libpoppler-private-dev imagemagick
# $ cd /path/to/pdf-tools
# $ make install-server-deps # optional
# $ make -s

# Emacs:
# libxml2-dev, libgnutls-dev, libgbm-dev, libselinux-dev, libotf-dev, libsystemd-dev,
# libm17m-dev, librsvg2-dev

# Checkers
# VERILOG
sudo apt-get install -y verilator

# Python
sudo apt-get install -y pylint


# make libc info
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


# Not sure those  configuration is still needed...

# # For Ubuntu and Japanese
# # I referred from this URL: http://d.hatena.ne.jp/sandmark/20140202/1391319720

# apt-get install latex-cjk-common latex-cjk-japanese latex-cjk-japanese-wadalab

# # install this to display Japanese in doc-view(i.e. ghostscript)
# # http://d.hatena.ne.jp/khiker/20070506
# sudo apt-get install cmap-adobe-japan1

# # ほんとに使えない場合これをためす
# # sudo apt-get install texlive-full texlive-lang-cjk xdvik-ja


