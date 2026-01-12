FROM nginx:alpine


RUN rm -rf /usr/share/nginx/html/*

COPY index.html /usr/share/nginx/html/index.html


COPY nginx.conf /etc/nginx/templates/nginx.conf.template


RUN apk add --no-cache bash gettext

EXPOSE 3000

CMD envsubst '$PORT' < /etc/nginx/templates/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'
