
set -e

# install network from git clone
`ghq root`/github.com/haskell/network/
autoreconf
./configure
cabal install -v3 --extra-include-dirs=`pwd`/include

cd ~/
cabal install hoogle
