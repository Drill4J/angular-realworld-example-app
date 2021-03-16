FROM nginx:latest

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh \
  && bash nodesource_setup.sh \
  && apt-get install nodejs -y \
  && node -v

EXPOSE 8080
