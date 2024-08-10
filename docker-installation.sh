GREEN='\033[32m'
RESET='\033[0m'

echo "${GREEN}welcome to docker installation${RESET}"
sudo apt update
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce
docker --version
sudo usermod -aG docker $USER
sudo apt install docker-compose
echo "${GREEN}Exiting from docker installation${RESET}"
sudo reboot
