FROM ruby:2.6.1

# Unoptimized version
# ADD . /app
# WORKDIR /app
# RUN gem install -g

# Optimized version
ADD Gemfile /app/Gemfile
WORKDIR /app
RUN gem install -g
ADD . /app

EXPOSE 9292
CMD rackup -E none
