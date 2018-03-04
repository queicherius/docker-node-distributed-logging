FROM node:9-alpine

# Create working directory
WORKDIR /application

# Install app dependencies
COPY package.json /application
RUN npm install

# Bundle the application code
COPY ./src /application/src

# Run the server
EXPOSE 3000
ENV NODE_ENV production

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
