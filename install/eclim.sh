# https://groups.google.com/forum/#!topic/emacs-eclim/4ZThI05vS4Y
# http://www.skybert.net/emacs/java/

INSTALL_DIR=/opt/local
mkdir -p $INSTALL_DIR
cd $INSTALL_DIR

# download eclipse
curl -o eclipse.tar.gz http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/juno/SR1/eclipse-java-juno-SR1-linux-gtk-x86_64.tar.gz
tar xvzf ./eclipse.tar.gz

# download eclim
git clone git://github.com/ervandew/eclim.git
cd eclim
ant clean deploy -Declipse.home=$INSTALL_DIR/eclipse

