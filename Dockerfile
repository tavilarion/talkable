FROM ruby:3.2.1-slim

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    less \
    git \
    libpq-dev \
    postgresql-client \
    libvips \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG workdir=/var/www/talkable

COPY Gemfile* /tmp/
WORKDIR /tmp

RUN gem install bundler
RUN bundle install

RUN mkdir -p $workdir

WORKDIR $workdir
ADD . $workdir

RUN rails assets:precompile
