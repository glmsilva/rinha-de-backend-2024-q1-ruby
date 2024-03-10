FROM ruby:3.2 AS base

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nginx

RUN mkdir /app
WORKDIR /app

COPY . /app

RUN bundle install

EXPOSE 3000

CMD ["bundle", "exec", "rackup", "-p", "3000", "--host", "0.0.0.0"]