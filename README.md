# ykh-docker-ci-server-config

This is a project for setting up CI server of YunKuHui microservices with CentOS.



Follow the official instruction in https://docs.docker.com/engine/installation/linux/docker-ce/centos/ to install Docker CE.

After installation, remember to enable docker as system service.

```Shell
systemctl enable docker
```



To install nodejs and npm, you can just use following command.

```Shell
yum install nodejs npm --enablerepo=epel
```

