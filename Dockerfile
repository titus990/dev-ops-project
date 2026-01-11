FROM nginx:alpine

# Remove default Nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy HTML
COPY index.html /usr/share/nginx/html/index.html

# Copy nginx template
COPY nginx.conf /etc/nginx/templates/nginx.conf.template

# Install envsubst
RUN apk add --no-cache bash gettext

# Expose any port (Railway sets the real one)
EXPOSE 3000

# Start Nginx with envsubst
CMD envsubst '$PORT' < /etc/nginx/templates/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'
