# Create image based on the official Node 6 image from dockerhub
FROM node:9.2.0-alpine

# Create a directory where our app will be placed
RUN mkdir -p /usr/src/pintail-whoami

# Change directory so that our commands run inside this new directory
WORKDIR /usr/src/pintail-whoami

# Copy dependency definitions
COPY package.json /usr/src/pintail-whoami

# Install dependecies
RUN npm install

# Get all the code needed to run the app
COPY . /usr/src/pintail-whoami

# Expose the port the app runs in
EXPOSE 80

# Serve the app
CMD node server.js $HOSTNAME