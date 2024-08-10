GREEN='\033[32m'
RESET='\033[0m'

echo "${GREEN}Welcome to jenkins installation${RESET}"
sudo apt update
sudo apt install openjdk-11-jdk
java -version
cd /opt
rm jenkins.war
sudo wget https://get.jenkins.io/war-stable/latest/jenkins.war
sudo java -jar jenkins.war
echo "${GREEN}Exiting from jenkins installation${RESET}"
