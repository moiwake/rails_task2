FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev mariadb-client nodejs
RUN mkdir /BookingApp
WORKDIR /BookingApp
COPY Gemfile /BookingApp/Gemfile
COPY Gemfile.lock /BookingApp/Gemfile.lock
RUN bundle install
COPY . /BookingApp
