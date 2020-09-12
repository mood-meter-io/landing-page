FROM node:14-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# RUN npm install
# If you are building your code for production
RUN yarn install

ENV NODE_ENV=production

# Bundle app source
COPY . .

RUN yarn run build

ENV HOST 0.0.0.0

EXPOSE 3000
CMD [ "yarn", "run", "start"]
