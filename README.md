# node-python-scraping-app
This project uses Puppeteer with Node.js to scrape a user-provided URL and serves the scraped data via a Python Flask web server.
Prerequisites:
Install docker on your machine
##Step1: Create scrape.js for scrape the data from the user specified URL and save the content like page title and heading as JSON
##Step2: Create server.py.This Flask app will serve the scraped JSON data
## Step3: Create Multi-stage Dockerfile 
Combine both stages in a singile Dockerfile using multi-stage builds.
## Step4: Create package.json: For Node dependencies.  and requirements.txt: For Python dependencies. 
##Step5
1) command for cloning  this repository to your ec2 instance 
   ```bash
   git clone
   ```
   
2) command for build the docker image by accepting the URL as arguiment 
   ```bash
   docker build --build-arg SCRAPE_URL="www.example.com" web-scraper .
   ```
   Here you can give the URL that you want

3) Command for running the conatiner
   ```bash
   docker run -d -p 5000:5000 web-scraper
   ```

   Now you can see the scraped data on your browser using your <ec2_ip_address>:5000

   
