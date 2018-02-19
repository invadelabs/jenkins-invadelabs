FROM jenkins/jenkins:lts
USER root
RUN apt-get update && apt-get install -y libltdl7 # docker dependency
# drop back to the regular jenkins user - good practice
USER jenkins
COPY plugins_docker.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
