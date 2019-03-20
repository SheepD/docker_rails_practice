FROM ruby:2.6

RUN apt-get update -yqq
RUN apt-get install --no-install-recommends -yqq nodejs

COPY . /usr/src/app/

WORKDIR /usr/src/app/
RUN bundle install

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
