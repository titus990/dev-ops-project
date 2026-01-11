# Use Nginx as a lightweight web server
FROM nginx:alpine

# Remove default Nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy your HTML file into Nginx's web folder
COPY index.html /usr/share/nginx/html/index.html

# Update Nginx to listen on port 3000 (Railway expects this)
RUN sed -i 's/listen       80;/listen 3000;/' /etc/nginx/conf.d/default.conf

# Expose port 3000
EXPOSE 3000

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
