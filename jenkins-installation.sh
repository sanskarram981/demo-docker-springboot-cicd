#!/bin/bash

GREEN='\033[32m'
RESET='\033[0m'

echo -e "${GREEN}Welcome to Jenkins installation${RESET}"

# Update and install OpenJDK
sudo apt update
sudo apt install -y openjdk-11-jdk

# Verify Java installation
java -version

# Download Jenkins WAR file
cd /opt
if [ -f jenkins.war ]; then
    echo "Removing existing jenkins.war file"
    sudo rm jenkins.war
fi
sudo wget https://get.jenkins.io/war-stable/latest/jenkins.war

# Create the systemd service file for Jenkins
SERVICE_FILE="/etc/systemd/system/jenkins.service"

if [ -f $SERVICE_FILE ]; then
    echo "Removing existing jenkins.service file"
    sudo rm $SERVICE_FILE
fi

sudo bash -c "cat > $SERVICE_FILE <<EOL
[Unit]
Description=Jenkins Continuous Integration Server
After=network.target

[Service]
ExecStart=/usr/bin/java -jar /opt/jenkins.war --httpPort=8080
User=ubuntu
Restart=always
RestartSec=10
LimitNOFILE=8192

[Install]
WantedBy=multi-user.target
EOL"

# Reload systemd configuration and start Jenkins service
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl enable jenkins
echo "please fire sudo systemctl status jenkins"

echo -e "${GREEN}Exiting from Jenkins installation${RESET}"
