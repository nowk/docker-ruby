FROM phusion/baseimage:0.9.17
MAINTAINER Yung Hwa Kwon <yung.kwon@damncarousel.com>

ENV RUBY_MAJOR 2.1
ENV RUBY_VERSION 2.1.7

# install dependencies
RUN apt-get update \
	&& apt-get install -y \
	autoconf \
	bison \
	build-essential \
	libssl-dev \
	libyaml-dev \
	libreadline6-dev \
	zlib1g-dev \
	libncurses5-dev \
	libffi-dev \
	libgdbm3 \
	libgdbm-dev \
	libyaml-dev \
	libxml2-dev libxslt-dev

# install ruby
RUN mkdir -p /usr/src/ruby \
	&& curl -SL "http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.bz2" \
	| tar -xjC /usr/src/ruby --strip-components 1

RUN cd /usr/src/ruby \
	&& autoconf \
	&& ./configure --disable-install-doc \
	&& make \
	&& make install

# clean up
RUN apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install bundler
RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc" \
	&& gem install bundler

ONBUILD ENV GEM_HOME /usr/local/bundle
# install the gems to mounted volume as .bundle
ONBUILD ENV GEM_HOME /src/.bundle
ONBUILD ENV PATH $GEM_HOME/bin:$PATH
ONBUILD RUN bundle config --global path "$GEM_HOME"
ONBUILD RUN bundle config --global bin "$GEM_HOME/bin"

# don't create ".bundle" in all our apps
ONBUILD ENV BUNDLE_APP_CONFIG $GEM_HOME

ONBUILD RUN mkdir -p /src
ONBUILD WORKDIR /src

# /src is the mounted source volume
ONBUILD VOLUME /src


LABEL \
	version=${RUBY_VERSION} \
	os="linux" \
	arch="amd64"
