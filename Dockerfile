# pull offical node image
FROM node:12.17-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# If you are building your code for production
RUN npm ci --only=production \
  && apk --no-cache add curl

# Bundle app source
COPY . .

HEALTHCHECK --interval=10s \
  --timeout=3s \
  --start-period=10s \
  --retries=3 \
  CMD curl -f http://localhost:3000/v1/robots/healthcheck/ || exit 1

EXPOSE 3000

ENTRYPOINT ["npm"]
CMD ["run", "start"]