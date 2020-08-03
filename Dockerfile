FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
    openjdk-8-jre openjdk-8-jdk curl software-properties-common ca-certificates apt-transport-https wget

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

RUN apt-get update && apt-get install -y \ 
    docker-ce jenkins

RUN /etc/init.d/docker start

RUN wget http://mirrors.jenkins-ci.org/war/2.250/jenkins.war

ENTRYPOINT [ "java", "-jar", "jenkins.war" ]

CMD [ "bash" ]