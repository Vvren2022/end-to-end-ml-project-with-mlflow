# BlobSha: 4f8558d504b7f28ea3d4062972b3624615eff876
FROM python:3.10-slim

# Install only necessary system packages (optional: awscli if you need it)
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
       awscli \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Leverage build cache: install deps before copying the whole repo
# Copy packaging metadata + requirements so pip can install -e .
COPY pyproject.toml setup.py requirements.txt /app/
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the application code
COPY . /app

# Expose Flask port
EXPOSE 8080

# Run the web app
CMD ["python", "app.py"]
