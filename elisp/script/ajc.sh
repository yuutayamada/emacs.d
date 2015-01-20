#!/bin/sh

export CLASSPATH=$JAVA_HOME:$ANDROID_SDK_HOME/platforms/android-21/android.jar:$CLASSPATH

cd $HOME/local/vcs/github.com/yuutayamada/emacs.d/elisp/el-get/auto-java-complete/

javac Tags.java
java -XX:MaxPermSize=512m -Xms256M -Xmx512M Tags

# Check whether $HOME/.java_base.tag is exist or not.
