FROM ruby:2.6

RUN gem install --no-doc unicorn rack

WORKDIR /app

COPY config.ru /app/config.ru

CMD unicorn -l 8000