FROM debian:stretch

RUN echo deb http://httpredir.debian.org/debian stretch-backports main \
    > /etc/apt/sources.list.d/stretch-backports.list && \
    apt-get update && \
    apt-get --no-install-recommends install -y openjdk-11-jre-headless && \
    rm -rfv /var/lib/apt/lists/*

# Non-chained commands that doesn't optimize the size the Docker image
# RUN echo deb http://httpredir.debian.org/debian stretch-backports main \
#     > /etc/apt/sources.list.d/stretch-backports.list
# RUN apt-get update
# RUN apt-get --no-install-recommends install -y openjdk-11-jre-headless
# RUN rm -rfv /var/lib/apt/lists/*
