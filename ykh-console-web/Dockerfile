FROM centos:7
LABEL Vendor="CentOS" \
      License=GPLv2 \
      Version=2.4.6-40

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum -y --setopt=tsflags=nodocs install php && \
    yum -y --setopt=tsflags=nodocs install php-mysql php-gd php-imap php-ldap php-odbc php-pear php-xml php-xmlrpc && \
    yum clean all

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./httpd.conf /etc/httpd/conf/httpd.conf
COPY . /var/www/html/

RUN chown -R apache /var/www/html

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]