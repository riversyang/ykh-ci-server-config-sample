# ykh-docker-ci-server-config

This is a project for setting up CI server of YunKuHui microservices with CentOS.

### Install vsftpd

```shell
yum install vsftpd
```

```shell
adduser ftpuser
passwd ftpuser
```

Then you should modify [/etc/vsftpd/vsftpd.conf], make the following changes.

```
...
anonymous_enable=NO
...
ascii_upload_enable=YES
ascii_download_enable=YES
...
#chroot_local_user=YES
chroot_list_enable=YES
chroot_list_file=/etc/vsftpd/chroot_list
...
(Add the following setting to the end of the file)
allow_writeable_chroot=YES
```

Add file [/etc/vsftpd/chroot_list] with the following contents.

```
ftpuser
```

And enable it as system service, start it.

```shell
systemctl enable vsftpd
systemctl start vsftpd
```

### Install Docker

Follow the official instruction in https://docs.docker.com/engine/installation/linux/docker-ce/centos/ to install Docker CE.

After installation, remember to enable docker as system service.

```Shell
systemctl enable docker
```

### Install nodejs and npm

To install nodejs and npm, you can just use following command. You may also need to install cnpm while you are in China.

```Shell
yum install nodejs npm --enablerepo=epel
npm install cnpm -g --registry=https://registry.npm.taobao.org
```

### Install Git

```shell
yum install git
```

### Install Maven

```shell
yum install maven
```

### Install MongoDB

Follow the official instruction in https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/ to install MongoDB.

### Install Java

```shell
yum install java-1.8.0-openjdk
```

### Setup Jenkins

Download jenkins.war from offcial site, and put it in [/home/jenkins]. Create a service setting file [/etc/systemd/system/jenkins.service] with the following contents.

```
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
systemctl start jenkins
```

