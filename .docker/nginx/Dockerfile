FROM nginx:1.13-alpine

WORKDIR /www

COPY .docker/nginx/config/app.conf /etc/nginx/conf.d/default.conf
COPY .docker/nginx/config/nginx.conf /etc/nginx/nginx.conf
