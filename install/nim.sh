set -e

NIM_LANG=`ghq root`/github.com/nim-lang

# nimble installation:
# You need add ~/.nimble/bin to PATH
if ! test -f $NIM_LANG/nimble/nimble.nimble >/dev/null 2>&1; then
  echo "Cloning nimble..."
  ghq get https://github.com/nim-lang/nimble.git
  cd $NIM_LANG/nimble
  nim c -r src/nimble install
fi

# nimsuggest installation:
if ! which nimsuggest >/dev/null 2>&1; then
  echo "Cloning nimsuggest..."
  ghq get https://github.com/nim-lang/nimsuggest
  cd $NIM_LANG/nimsuggest
  nimble build
  # Move bin file to Nim's bin directory
  mv nimsuggest $NIM_LANG/bin
fi

