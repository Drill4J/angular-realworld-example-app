# FROM node:14.5.0-alpine3.12 as build
FROM nginx:latest

# Copy nginx config
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Copy sample project
WORKDIR /var/www
COPY ./dist ./

CMD nginx -g "daemon off;"