# Dockerfile
# Using Python for simple HTTP server
FROM python:3.9-alpine

# Set working directory
WORKDIR /app

# Copy the HTML file
COPY boxing-website.html /app/index.html

# Install Python dependencies (none needed for simple server)
# Just ensure we have the latest pip
RUN pip install --no-cache-dir --upgrade pip

# Expose port 8000
EXPOSE 8000

# Start the Python HTTP server
CMD ["python", "-m", "http.server", "8000"]