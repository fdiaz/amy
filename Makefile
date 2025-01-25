.PHONY: install
install:
	gem build amy.gemspec
	gem install amy-0.1.0.gem
