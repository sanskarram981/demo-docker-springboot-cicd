GREEN='\033[32m'
RESET='\033[0m'

echo "${GREEN}Welcome to jenkins installation${RESET}"
sudo apt update
sudo apt install openjdk-8-jdk
java -version
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins
echo "${GREEN}Exiting from jenkins installation${RESET}"
