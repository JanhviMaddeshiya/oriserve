#!/bin/bash
# Cleanup old deployment directories
echo "Cleaning up old deployment directories..."
rm -rf /opt/codedeploy-agent/deployment-root/*
echo "Cleanup complete."
