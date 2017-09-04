
all:
	cask eval "(progn (require 'robocup-training) (my-org-publish))"

install:
	cask install

lint:
	cask eval "(progn (require 'robocup-training) (rc-org-lint))"
