FROM jenkins/jenkins:centos

USER root

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG http_port=8080
ARG JENKINS_HOME=/var/jenkins_home
ARG REF=/usr/share/jenkins/ref

ENV JENKINS_HOME=/var/jenkins_home
ENV JENKINS_SLAVE_AGENT_PORT=50000
ENV REF=/usr/share/jenkins/ref
ENV JAVA_HOME=/etc/alternatives/jre_openjdk

VOLUME [/var/jenkins_home]

EXPOSE 8080
EXPOSE 50000

RUN yum -y update && yum install -y epel-package python-pip sshpass && yum clean all
RUN pip install ansible

USER jenkins
