FROM ruby:3.1

RUN apt-get update -qq && apt-get install -y nodejs yarn
RUN mkdir /myapp
WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

COPY . /myapp

EXPOSE 3000
ENTRYPOINT ["/bin/sh", "-c", "while :; do sleep 10; done"]