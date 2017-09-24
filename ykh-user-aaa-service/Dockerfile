
FROM node:6
#
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p /home/nodejs/app
WORKDIR /home/nodejs/app

COPY . .

EXPOSE 3999

CMD ["node", "./bin/www"]
