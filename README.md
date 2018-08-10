jenkins-invadelabs
==================
Jenkins container for invadelabs.

## Build it
```
docker build -t jenkins-invadelabs:0.0.3 .
```

## Run it
```
mkdir -p /home/drew/jenkins_home

docker run --name jenkins-invadelabs \
-p 8081:8080 \
-p 50000:50000 \
-v /home/drew/jenkins_home:/var/jenkins_home \
-v /usr/bin/docker:/usr/bin/docker \
-v /var/run/docker.sock:/var/run/docker.sock \
--env JAVA_OPTS="-Dhudson.footerURL=https://build.invadelabs.com/ -Djenkins.install.runSetupWizard=false" \
-d \
jenkins-invadelabs:0.0.3
```

## Start it
After a stop of the container or reboot of host system:
```
docker start jenkins-invadelabs
```

## Notes / Old

### Fedora 27
Issues with fedora using unix socket fd:// and tcp:// - there can only be one!
```
vi /lib/systemd/system/docker.service
ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:2375
```

Note to add so docker command works.
```
export DOCKER_HOST=tcp://192.168.1.125:2375
```

Note on location of docker.sock if going this route.
```
unix:///var/run/docker.sock
```

Need docker.sock accessible by jenkins user.
```
docker exec --user root -it jenkins-invadelabs1 /bin/sh
# both chown and chmod are badly insecure in this case :(
# chown jenkins:jenkins /var/run/docker.sock
chmod 777 /var/run/docker.sock
```
