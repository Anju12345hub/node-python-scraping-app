# node-python-scraping-app
This project uses Puppeteer with Node.js to scrape a user-provided URL and serves the scraped data via a Python Flask web server.
Prerequisites:
Install docker on your machine
## Step 1: Create scrape.js for scrape the data from the user specified URL and save the content like page title and heading as JSON
Uses Puppeteer to launch a headless browser
## Step2: Create server.py
This Flask app will serve the scraped JSON data
## Step3: Create Multi-stage Dockerfile 
Combine both stages in a single Dockerfile using multi-stage builds.
## Step4: Create package.json: For Node dependencies.  and requirements.txt: For Python dependencies. 
## Step5
1) Command for cloning  this repository to your ec2 instance 
   ```bash
   git clone https://github.com/Anju12345hub/node-python-scraping-app.git
   cd node-python-scraping-app
   ```
   
2) Command for build the docker image by accepting the URL as arguiment 
   ```bash
   docker build --build-arg SCRAPE_URL="www.example.com" web-scraper .
   ```
   Replace "https://www.example.com" with the actual URL you want to scrape.

3) Command for running the container
   ```bash
   docker run -d -p 5000:5000 web-scraper
   ```

4) Now, open your browser and go to:
5) ```bash
   http://<ec2_ip_address>:5000
   ```
   You should see the scraped data displayed as JSON.

   
