#!/bin/bash

# Update package repository
apt-get update

# Install Python and other dependencies
apt-get install -y python3 python3-pip

# Install Python dependencies from requirements.txt
pip3 install -r /opt/myapp/requirements.txt

# Any additional setup, e.g., setting environment variables
export MYAPP_ENV=production
