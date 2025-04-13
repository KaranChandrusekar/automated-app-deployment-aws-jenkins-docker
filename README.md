## automated-app-deployment-aws-jenkins-docker ##

# React Application Deployment Guide

This document outlines steps to deploy the React application to production, including Dockerization, CI/CD with Jenkins, AWS setup, and monitoring. Kindly see the attached screenshots for the entire process.

## Prerequisites
- Docker & Docker Compose
- Git
- Jenkins
- AWS Account
- Docker Hub Account

---

1. Clone Repository:
```bash
git clone https://github.com/sriram-R-krishnan/devops-build
cd devops-build/build
```
2. Docker Setup:
 - Creation of dockerfile for build the image.
 - Creation of docker-compose.yml file for deploying the custom image.

3. Bash Scripts:
 - Build script for build the images and deploying the service in container.
 - Deploy script, When it is pushed to dev branch - Image will be build and pushed to public repo. For merge to main branch, image will be pushed to private repo.
 - karanchandrusekar/react_e-commerce:v1  &  karanchandrusekar/react_e-commerce_app-private:v1

4. Version Control:
 - Using .gitignore && .dockerignore - to exclude .env file which contained Dockerhub credentials.
 - Push to GitHub
```bash
git checkout -b dev
git add .
git commit -m "comments"
git push origin dev
```
5. Docker Hub Setup
   - created two repo's, private and public to simulate dev & prod environment.

6. Jenkins Configuration
 - Install required Pipeline plugins and dependencies.
 - Create Multi-branch pipelines: Trigger: dev branch commits & Trigger: main branch commits (after merging dev).
 - See attached Jenkinsfile.

7. Monitoring:
   - Uptime Kuma: Monitors the Webapp's IP which is exposed to EC2 public IP under Port 80, Once the application http request fail within 60s interval, It triggers a mail notification.
   - Prometheus & Alert Manager: Create configuration files for rules, alerts, alert.manager & Prometheus to scrape metrics using blackbox exporter targetted same EC2 public IP under port 80. When the configured alert triggered, E-mail notication will be sent.
  
# Conclusion:
- Recommend a T2.medium, I had used t2.micro which the CPU utilization peaked and rebooted many times.
- For SG: Open port 80 and allow access to all & for SSH - under 22 port and your IP. Open ports for required services like jenkins, uptime kuma and others under your IP.
