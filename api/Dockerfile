FROM node:9-alpine

# Create working directory
WORKDIR /application

# Install app dependencies
COPY package.json /application
RUN npm install

# Bundle the application code
COPY ./src /application/src

# Run the server
ENV NODE_ENV production
EXPOSE 3000
CMD npm start
