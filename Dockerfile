FROM jenkins/jenkins:centos

USER root

ARG http_proxy
ARG resolv

#RUN apt-get update && apt-get install -y python-pip && rm -rf /var/lib/apt/lists/*
RUN echo "nameserver $resolv\n" > /etc/resolv.conf && echo "proxy = $http_proxy" >> /etc/yum.conf && yum -y update && yum install -y epel-package python-pip sshpass && yum clean all
RUN export http_proxy=$http_proxy && export https_proxy=$http_proxy && pip install ansible

USER jenkins
