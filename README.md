jenkins-invadelabs
==================
Jenkins container for invadelabs.

## Build it
```
docker build -t jenkins-invadelabs:0.0.1 .
```

## Run it
```
mkdir -p /home/drew/jenkins_home

docker run --name jenkins-invadelabs1 \
-d \
-p 8083:8080 \
-p 50000:50000 \
-v /home/drew/jenkins_home:/var/jenkins_home \
--env JAVA_OPTS="-Dhudson.footerURL=https://build.invadelabs.com/ -Djenkins.install.runSetupWizard=false" \
jenkins-invadelabs:0.0.1
```

## Start after reboot
```
docker start jenkins-invadelabs
```

# Old / notes
```
FROM debian:jessie
FROM openjdk:8-jdk

docker run --name jenkins-invadelabs \
-p 8082:8080 \
-p 50000:50000 \
-v /home/drew/jenkins_home:/var/jenkins_home \
jenkins/jenkins:lts
```
