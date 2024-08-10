pipeline {
    agent any

    stages {
        stage('SourceCode Checkout Stage') {
           steps {
                    git branch: 'main',
                    url: 'https://github.com/sanskarram981/demo-docker-springboot-cicd.git',
                    credentialsId: 'sanskar-credential'
            }
        }
        stage('SourceCode TestCases Stage') {
           steps {
                    sh './mvnw clean test'
            }
        }
        stage('Artifact Build Stage') {
           steps {
                    sh './mvnw package'
            }
        }
        stage('Artifact Verfication Stage') {
           steps {
                    sh './mvnw verify'
            }
        }
        stage('Docker Image Creation Stage') {
           steps {
                      sh 'docker stop demo-app-container'
                      sh 'docker rm -f demo-app-container'
                      sh 'docker rmi -f demo-app:latest'
                      sh 'docker build -t demo-app:latest .'
            }
        }
        stage('Deploying as container in current environment') {
           steps {
                    sh 'docker run --name demo-app-container -d -p 9090:9090 demo-app:latest'
            }
        }
    }
}
