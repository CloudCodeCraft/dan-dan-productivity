FROM ruby:3.3

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
  build-essential \
  libpq-dev \
  postgresql-client \
  git \
  curl \
  && rm -rf /var/lib/apt/lists/*

ENV GEM_HOME=/usr/local/bundle
ENV BUNDLE_PATH=/usr/local/bundle
ENV BUNDLE_BIN=/usr/local/bundle/bin
ENV PATH="/usr/local/bundle/bin:${PATH}"

WORKDIR /backend
COPY ./backend ./backend

EXPOSE 3000
