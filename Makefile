
RUBY_VERSION=2.1.7

defualt: build-all

build-docker-base:
	docker build \
		-f Dockerfile.base \
		--rm -t nowk/ruby-base:${RUBY_VERSION} .

build-docker-env:
	docker build \
		-f Dockerfile.env \
		--rm -t nowk/ruby-env:${RUBY_VERSION} .

build-all: build-docker-base build-docker-env
