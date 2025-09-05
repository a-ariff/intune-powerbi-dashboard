# Minimal Dockerfile for Intune Power BI Dashboard
# This serves as a template and can be modified as needed

# Use a lightweight base image with Python for serving
FROM python:3.11-alpine

# Set working directory
WORKDIR /app

# Install minimal packages
RUN pip install --no-cache-dir http.server

# Copy application files
COPY . /app

# Expose port for HTTP server
EXPOSE 8000

# Command to serve files (example - customize as needed)
# For Power BI files, you might want to serve them via a web server
# or run custom scripts for dashboard generation
CMD ["python", "-m", "http.server", "8000", "--bind", "0.0.0.0"]

# Alternative examples:
# CMD ["python", "src/dashboard_generator.py"]
# CMD ["python", "src/data_processor.py"]
