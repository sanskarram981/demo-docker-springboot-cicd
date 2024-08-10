echo "welcome to docker installation"
sudo apt update
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce
docker --version
sudo usermod -aG docker $USER
sudo apt install docker-compose
echo "Exiting from docker installation"
sudo reboot
