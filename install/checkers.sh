#!/bin/bash

# SHELLSCRIPT: https://github.com/koalaman/shellcheck/
cabal update
cabal install shellcheck
# Or you may install by apt-get instead of using cabal
# apt-get install -y shellcheck

# VERILOG
sudo apt-get install -y verilator

# Python
sudo apt-get install -y pylint
