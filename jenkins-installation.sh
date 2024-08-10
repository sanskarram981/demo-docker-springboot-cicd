GREEN='\033[32m'
RESET='\033[0m'

echo "${GREEN}Welcome to jenkins installation${RESET}"
docker --version
docker stop jenkins-container
docker rm jenkins-container
docker pull jenkins/jenkins:lts
docker run -d --name jenkins-container -p 8080:8080 -p 50000:50000 -v /var/jenkins_home_v2:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:lts
docker logs jenkins-container
echo "${GREEN}Exiting from jenkins installation${RESET}"
