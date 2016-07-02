# makefile for Travis

EMACS ?= emacs
EMACS_CLEAN=-Q
EMACS_BATCH=$(EMACS_CLEAN) --batch

test: clean-elc
	git submodule init
	git submodule update
	$(EMACS) $(EMACS_BATCH) --script test.el

clean-elc:
	find elisp -type f -name *.elc -print | xargs rm -f
	find .emacs -type f -name *.elc -print | xargs rm -f

build: clean-elc
	git submodule init
	git submodule update
	sh ./install/before_install.sh

howlong:
	find ./.emacs -name '*.el' | xargs wc -l | tail -1

# .PHONY: all test unit install
