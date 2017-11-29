FROM node:9.2.0-alpine

EXPOSE 3000

RUN npm install -g @angular/cli

ADD . /home/node/pintail-docker-example

WORKDIR /home/node/pintail-docker-example

CMD node server.js $HOSTNAME