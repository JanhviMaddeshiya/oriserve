#!/bin/bash

# Navigate to the application directory
cd /opt/myapp

# Start the application
# Example using a Python web server, replace with your actual start command
nohup python3 manage.py runserver 0.0.0.0:8000 > app.log 2>&1 &

# Optionally, you can check if the application is running
ps aux | grep app.py
