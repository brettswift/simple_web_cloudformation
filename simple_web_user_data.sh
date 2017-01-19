#!/bin/bash
#This file is sourced from the s3 bucket
mkdir /var/simpleweb
cd /var/simpleweb
nohup python -m SimpleHTTPServer 8000 & 2>&1
echo "hello from `dig +short myip.opendns.com @resolver1.opendns.com`" > /var/simpleweb/index.html
echo "healthy" > /var/simpleweb/health.html
yum install stress -y
nohup stress --cpu 2 --timeout 600 & 2>&1
