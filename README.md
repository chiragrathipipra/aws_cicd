# aws_cicd
#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
set -xe

REGION="YOUR_AWS_REGION"   # e.g. ap-south-1

# Update & basic tools
apt-get update -y
apt-get install -y ruby-full wget curl unzip

# Java 17
apt-get install -y openjdk-17-jdk
java -version

# Install CodeDeploy agent
cd /tmp
wget https://aws-codedeploy-${REGION}.s3.${REGION}.amazonaws.com/latest/install
chmod +x ./install
./install auto
systemctl enable codedeploy-agent
systemctl start codedeploy-agent
systemctl status codedeploy-agent || true

# Open port 8080 in UFW if you use it (optional)
if command -v ufw >/dev/null 2>&1; then
  ufw allow 8080 || true
fi

# Create app dir
mkdir -p /opt/myapp
chown -R ubuntu:ubuntu /opt/myapp
