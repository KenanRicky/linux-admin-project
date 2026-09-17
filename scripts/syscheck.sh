
#!/bin/bash

# Linux Administration Project
# System and NGINX health check


PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "======================================"
echo " Linux Administration Health Check"
echo "======================================"

echo "Hostname: $(hostname)"
echo "User: $(whoami)"
echo

echo "Checking project directories..."

directories=("scripts" "site" "docs" "logs")

for dir in "${directories[@]}"; do
    if [ -d "$PROJECT_DIR/$dir" ]; then
        echo "[OK] $dir exists"
    else
        echo "[ERROR] $dir is missing"
    fi
done

echo
echo "Disk Usage:"
df -h /

echo
echo "Memory Usage:"
free -h

echo
echo "Checking NGINX..."

if systemctl is-active --quiet nginx; then
    echo "[OK] NGINX is running"
else
    echo "[ERROR] NGINX is not running"
fi

echo
echo "Testing NGINX configuration..."

if sudo nginx -t; then
    echo "[OK] NGINX configuration is valid"
else
    echo "[ERROR] NGINX configuration has a problem"
fi

echo
echo "Health check completed."
