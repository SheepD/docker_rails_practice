FROM ruby:2.6

LABEL maintainer="maru@sheepd.com"

# allow apt to work with https sources
RUN apt-get update -yqq && apt-get install --no-install-recommends -yqq \
  apt-transport-https

# install an updated version of node
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -

# remove cmdtest cause of yarn conflict
# https://github.com/yarnpkg/yarn/issues/2821#issuecomment-306101401
RUN apt-get remove -yqq cmdtest

# ensure latest packages for yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
  tee /etc/apt/sources.list.d/yarn.list

# install deps to run
RUN apt-get update -yqq && apt-get install --no-install-recommends -yqq \
  nodejs \
  yarn

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install
COPY package.json /usr/src/app/
COPY yarn.lock /usr/src/app/
RUN yarn

COPY . /usr/src/app/

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
