#!/bin/bash

# Remove old files from the application directory
rm -rf /var/www/myapp/*

# Remove the problematic directory that might cause conflicts
rm -rf /opt/codedeploy-agent/deployment-root/*

# Optionally, remove other specific directories or files
# rm -rf /opt/codedeploy-agent/deployment-root/8fb70ad6-a31f-4385-96a5-a4278460c933/d-QSB8YHE88/deployment-archive/venv/lib64
