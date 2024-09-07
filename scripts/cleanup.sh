# #!/bin/bash

# # Remove old files from the application directory
# rm -rf /var/www/myapp/*

# # Remove the problematic directory that might cause conflicts
# rm -rf /opt/codedeploy-agent/deployment-root/*

# # Optionally, remove other specific directories or files
# # rm -rf /opt/codedeploy-agent/deployment-root/8fb70ad6-a31f-4385-96a5-a4278460c933/d-QSB8YHE88/deployment-archive/venv/lib64


#!/bin/bash

# Clean up old application files if they exist
if [ -d /var/www/myapp/venv ]; then
    rm -rf /var/www/myapp/venv
fi

# Remove other temporary files or directories if needed
rm -rf /var/www/myapp/tmp/
rm -rf /var/www/myapp/cache/
