
RUBY_VERSION=2.1.7

build-docker:
	docker build --rm -t nowk/ruby-env:${RUBY_VERSION} .
