FROM centos:7

ADD proxy.conf /etc/yum/proxy.conf

RUN sed -i 's/^mirrorlist/#mirrorlist/' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's/^#baseurl/baseurl/' /etc/yum.repos.d/CentOS-Base.repo
