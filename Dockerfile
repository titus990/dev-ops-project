FROM nginx:alpine

# Remove default content
RUN rm -rf /usr/share/nginx/html/*

# Copy your HTML file
COPY index.html /usr/share/nginx/html/index.html

# Copy Railway-ready Nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Expose Railway port
EXPOSE 3000

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
