#!/bin/bash

set -e

apt-get update
apt-get install -y nginx

cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>HUG Project 3</title>
</head>
<body>
    <h1>HUG Project 3</h1>
    <h2>Two-Tier Application</h2>
    <p>Deployed by: ${my_name}</p>
    <p>Infrastructure provisioned using Terraform.</p>
    <p>Web Tier: Nginx on Azure Linux VM</p>
    <p>Database Tier: MySQL Flexible Server</p>
</body>
</html>
EOF

systemctl enable nginx
systemctl restart nginx
