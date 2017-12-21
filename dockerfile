# Create image based on the official Node 6 image from dockerhub
FROM node:9.3.0-alpine

#Linux setup
RUN apk update \
  && apk add --update alpine-sdk \
  && apk del alpine-sdk \
  && rm -rf /tmp/* /var/cache/apk/* *.tar.gz ~/.npm \
  && npm cache verify \
  && sed -i -e "s/bin\/ash/bin\/sh/" /etc/passwd

#Angular CLI
RUN npm install -g @angular/cli@1.5.5

# Create a directory where our app will be placed
RUN mkdir -p /usr/src/pintail-whoami

# Change directory so that our commands run inside this new directory
WORKDIR /usr/src/pintail-whoami

# # Copy dependency definitions
# COPY package.json /usr/src/pintail-whoami

# # Install dependecies
# 

# Get all the code needed to run the app
ADD . /usr/src/pintail-whoami

RUN npm install && ng build

# Expose the port the app runs in
EXPOSE 80

# Serve the app
CMD node server.js $HOSTNAME