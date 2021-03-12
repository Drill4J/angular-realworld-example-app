FROM nginx:latest

# Copy nginx config
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www
COPY ./ ./

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh \
  && bash nodesource_setup.sh \
  && apt-get install nodejs -y \
  && node -v \
# Install build tools
## angular-cli
  && npm i -g @angular/cli \
## yarn
  && npm i -g yarn \
# Install project dependencies
  && yarn install

EXPOSE 8080

# Replace default REALWORLD_API_ADDRESS
CMD sed -i 's!https://conduit.productionready.io/api!'${REALWORLD_API_ADDRESS}'!g' /var/www/src/environments/environment.prod.ts \
  && sed -i 's!https://conduit.productionready.io/api!'${REALWORLD_API_ADDRESS}'!g' /var/www/src/environments/environment.ts \
# Build project
  && ng build \
# Configure Drill4J parsing utility
## Replace default JS agent host in drill4j config
  && sed -i 's!jsagent:9404!'${DRILL_JS_AGENT_HOST}'!g' /var/www/drill4js.config.json \
## Replace default agent id
  && sed -i 's!default-agent-id!'${DRILL_JS_AGENT_AGENT_ID}'!g' /var/www/drill4js.config.json \
## Replace default group id
  && sed -i 's!default-group-id!'${DRILL_JS_AGENT_GROUP_ID}'!g' /var/www/drill4js.config.json \
# Run Drill4J parsing utility
  && npx drill4js-cli@${DRILL_JS_AST_PARSER_VERSION} -c /var/www/drill4js.config.json -b ${REALWORLD_BUILD_VERSION} \
# # Run nginx
  && nginx -g "daemon off;"
