NAME=ruby
VERSION=$(shell cat $(shell readlink -f "./VERSION"))


$.PHONY: ruby-shared-volume

ruby-shared-volume:
	docker run -v /usr/local/bundle --entrypoint /usr/local/bin/ruby --name $(NAME)v$(VERSION) $(NAME):$(VERSION) --version

