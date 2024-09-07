#!/bin/bash
# Apply database migrations
echo "Applying database migrations..."
cd /opt/codedeploy-agent/deployment-root/${deploymentId}/deployment-archive/
source venv/bin/activate
python manage.py migrate
echo "Database migrations complete."
