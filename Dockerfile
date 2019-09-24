FROM jenkins/jenkins

USER root

RUN apt-get update -y && apt-get install -y python-pip sshpass apt-utils && apt-get clean
RUN pip install ansible

USER jenkins
