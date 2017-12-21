FROM node:9.3.0-alpine

RUN npm install -g @angular/cli@1.5.5 \
  && mkdir -p /usr/src/pintail-whoami

WORKDIR /usr/src/pintail-whoami

ADD . /usr/src/pintail-whoami

RUN npm install && ng build

EXPOSE 80

CMD node server.js $HOSTNAME