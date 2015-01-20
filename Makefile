EMACS ?= emacs
EMACS_CLEAN=-Q
EMACS_BATCH=$(EMACS_CLEAN) --batch

test: clean-elc
	git submodule init
	git submodule update
	$(EMACS) $(EMACS_BATCH) --script test.el

clean-elc:
	rm -f .emacs/*.elc *.elc

.PHONY:	all test unit install
