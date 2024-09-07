#!/bin/bash
# Start the Django server
echo "Starting Django server..."
cd /opt/codedeploy-agent/deployment-root/${deploymentId}/deployment-archive/
source venv/bin/activate
python manage.py runserver 0.0.0.0:8000 &
echo "Django server started."
