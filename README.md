# ykh-docker-ci-server-config

This is a project for setting up CI server of YunKuHui microservices with CentOS.

#### Install docker

Follow the official instruction in https://docs.docker.com/engine/installation/linux/docker-ce/centos/ to install Docker CE.

After installation, remember to enable docker as system service.

```Shell
systemctl enable docker
```

#### Install nodejs and npm

To install nodejs and npm, you can just use following command.

```Shell
yum install nodejs npm --enablerepo=epel
```

#### Install Maven

```shell
yum install maven
```

#### Install MongoDB

Follow the official instruction in https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/ to install MongoDB.

#### Setup Jenkins

Download jenkins.war from offcial site, and put it in [/home/jenkins]. Create a service setting file [/etc/systemd/system/jenkins.service] with the following contents.

```shell
[Unit]
Description=jenkins
After=network.target
[Service]
ExecStart=/usr/bin/java -jar jenkins.war --httpPort=8080
Restart=always
RestartSec=1
User=root
Group=root
Environment=PATH=/usr/bin:/usr/local/bin
WorkingDirectory=/home/jenkins
[Install]
WantedBy=multi-user.target
```

Reload systemctl config and enable it as startup service.

```shell
systemctl daemon-reload
systemctl enable jenkins
```

