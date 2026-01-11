FROM nginx:alpine

# Remove default Nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy HTML
COPY index.html /usr/share/nginx/html/index.html

# Copy Railway-ready nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf

# Expose any port (Railway sets it dynamically)
EXPOSE 3000

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
