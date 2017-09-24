
FROM tomcat:7

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./target/ledger-services.war /usr/local/tomcat/webapps/ledger-services.war
COPY ./server.xml /usr/local/tomcat/conf/server.xml
COPY ./web.xml /usr/local/tomcat/conf/web.xml

CMD ["catalina.sh", "run"])
