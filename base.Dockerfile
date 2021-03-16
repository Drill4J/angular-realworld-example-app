FROM drill4j/nginx-node:12.x

WORKDIR /var/www
COPY ./package.json ./package.json
COPY ./tsconfig.json ./tsconfig.json
COPY ./angular.json ./angular.json
COPY ./yarn.lock ./yarn.lock

# Install build tools
## angular-cli
RUN npm i -g @angular/cli \
## yarn
  && npm i -g yarn \
# Install project dependencies
  && yarn install

EXPOSE 8080
