# Multi-stage Dockerfile 

# First Stage: Node.js scraper
FROM node:18-slim AS scraper

WORKDIR /app

# Install  required (Chromium,fonts) dependencies
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    && rm -rf /var/lib/apt/lists/*

# Set environment variable to use installed Chromium
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy scraper script
COPY scrape.js ./

# Run scraper
ARG SCRAPE_URL
ENV SCRAPE_URL=${SCRAPE_URL}
RUN node scrape.js

# Second Stage: Python Flask server
FROM python:3.10-slim AS server

WORKDIR /app

# Copy scraped data
COPY --from=scraper /app/scraped_data.json ./

# Copy Flask server script and dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY server.py ./

# Expose Flask port
EXPOSE 5000

# Start the Flask server
CMD ["python", "server.py"]
