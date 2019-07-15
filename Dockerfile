FROM node:boron

ENV NODE_ENV production

# Create app directory
RUN mkdir -p /usr/src/app

# Enable chokidar polling so hot-reload mechanism can work on docker or network volumes
ENV CHOKIDAR_USEPOLLING true

WORKDIR /usr/src/app

COPY package.json package-lock.json /usr/src/app/
RUN npm install

COPY . /usr/src/app

EXPOSE 8080 9876

CMD [ "node", "lib", "index.js" ]

