FROM ruby: 3.3 AS base

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nginx

RUN mkdir /app
WORKDIR /app

COPY . /app

RUN bundle install

EXPOSE 4000

CMD ["bundle", "exec", "rackup", "-p", "4000"]