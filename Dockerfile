FROM ruby:2.3.0

USER root

COPY Gemfile* /tmp/
WORKDIR /tmp
RUN bundle install

ENV  APP_DIR /webapp/current

RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR
ADD . $APP_DIR

EXPOSE 80

CMD bundle exec puma -p 80
