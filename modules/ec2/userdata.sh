#!/bin/bash

# Update packages
dnf update -y

# Install Nginx
dnf install -y nginx

# curl-minimal is already available on Amazon Linux
# No need to install the full curl package

# Get Instance Metadata Token
TOKEN=$(curl -sX PUT \
  "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Get Public IP
PUBLIC_IP=$(curl -s \
  -H "X-aws-ec2-metadata-token: $TOKEN" \
  "http://169.254.169.254/latest/meta-data/public-ipv4")

# Get Private IP
PRIVATE_IP=$(curl -s \
  -H "X-aws-ec2-metadata-token: $TOKEN" \
  "http://169.254.169.254/latest/meta-data/local-ipv4")

# Get Availability Zone
AZ=$(curl -s \
  -H "X-aws-ec2-metadata-token: $TOKEN" \
  "http://169.254.169.254/latest/meta-data/placement/availability-zone")

# Convert Availability Zone to Region
REGION="${AZ::-1}"

# Create HTML page
cat > /usr/share/nginx/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>EC2 Server Test</title>
</head>
<body>
    <h1>EC2 Web Server is Running</h1>

    <p><b>Public IP:</b> $PUBLIC_IP</p>
    <p><b>Private IP:</b> $PRIVATE_IP</p>
    <p><b>Availability Zone:</b> $AZ</p>
    <p><b>AWS Region:</b> $REGION</p>
</body>
</html>
EOF

# Enable and start Nginx
systemctl enable nginx
systemctl start nginx