FROM ruby:2.7.1

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && \
apt-get install -y build-essential \
libpq-dev \
nodejs \
yarn \
shared-mime-info \
&& rm -rf /var/lib/apt/lists/*

ENV APP_ROOT /app

RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

COPY /Gemfile $APP_ROOT/Gemfile
COPY /Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
