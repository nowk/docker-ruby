NAME=ruby
VERSION=$(shell cat $(shell readlink -f "./VERSION"))


$.PHONY: ruby-shared-volume

ruby-shared-volume:
	docker run -v /usr/local/bundle -v /usr/local/lib/ruby --entrypoint /usr/local/bin/ruby --name $(NAME)v$(VERSION) $(NAME):$(VERSION) --version

