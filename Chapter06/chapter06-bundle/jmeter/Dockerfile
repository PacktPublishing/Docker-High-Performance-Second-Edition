FROM openjdk:11-jre-stretch



RUN curl -s https://www.apache.org/dist/jmeter/binaries/apache-jmeter-5.1.tgz | tar xz

ADD benchmark.jmx /jmeter/benchmark.jmx

WORKDIR /jmeter
RUN /apache-jmeter-5.1/bin/create-rmi-keystore.sh -dname 'CN=jmeter'

EXPOSE 1099
EXPOSE 1100

ENTRYPOINT ["/apache-jmeter-5.1/bin/jmeter"]

CMD ["-j", "/dev/stdout", "-s", \
     "-Dserver_port=1099", "-Jserver_rmi_localport=1100"]