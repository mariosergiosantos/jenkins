FROM jenkins/jenkins

USER jenkins

ENV JAVA_OPTS -Dhudson.footerURL=http://negociosdanet.com

COPY config/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

EXPOSE 8080