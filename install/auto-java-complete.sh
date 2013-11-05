# This shell script will generate a file ~/.java_base.tag in your home directory
# see "Install" in auto-java-complete

cd ../elisp/el-get/auto-java-complete
if test -f Tags.java; then
  echo `pwd`
  ANDROID_JAR="${ANDROID_SDK_HOME}/platforms/android-19/android.jar"
  export CLASSPATH=$CLASSPATH:$ANDROID_JAR
  javac Tags.java && java -XX:MaxPermSize=512m Tags
else
  echo "Tags.java not found"
fi
