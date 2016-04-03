NAME=nowk/ruby
VERSION=$(shell cat $(shell readlink -f "./VERSION"))

default: $(VERSION)

base:
	docker build -f Dockerfile.$@ --rm -t $(NAME)-$@:$(VERSION) .

onbuild: base
	docker build -f Dockerfile.$@ --rm -t $(NAME)-$@:$(VERSION) .

$(VERSION): onbuild
	docker build --rm -t $(NAME):$(VERSION) .


push:
	docker push $(NAME)-base:$(VERSION)
	docker push $(NAME)-onbuild:$(VERSION)
	docker push $(NAME):$(VERSION)

$.PHONY: push
