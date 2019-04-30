FROM jenkins/jenkins:lts

ARG docker_version=18.09.5
ARG docker_tarball=https://download.docker.com/linux/static/stable/x86_64/docker-$docker_version.tgz

LABEL com.docker.version=$docker_version

USER root
RUN cd /usr/local/bin && \
    curl -s $docker_tarball | tar xz docker/docker --strip-components=1

USER jenkins
COPY init.groovy.d/plugins.groovy \
     /usr/share/jenkins/ref/init.groovy.d/plugins.groovy
