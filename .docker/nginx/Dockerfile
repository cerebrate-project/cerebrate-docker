FROM nginx:1.13-alpine

LABEL maintainer="Circl Team <info@circl.lu>" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.name="cerebrate-nginx" \
      org.label-schema.description="Modified NGINX Server for cerebrate" \
      org.label-schema.url="https://github.com/cerebrate-project/cerebrate" \
      org.label-schema.vcs-url="https://github.com/cerebrate-project/cerebrate.git" \
      org.label-schema.vendor="cerebrate-project"

WORKDIR /www

COPY .docker/nginx/config/app.conf /etc/nginx/conf.d/default.conf
COPY .docker/nginx/config/nginx.conf /etc/nginx/nginx.conf
