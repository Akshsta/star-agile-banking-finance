pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "akku1999/banking"
        DOCKERHUB_CREDENTIALS = 'dockerhub-credentials' // Jenkins credential ID
        CONTAINER_NAME = "banking"
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Akshsta/star-agile-banking-finance.git', branch: 'master'
            }
        }

        stage('Build & Test') {
            steps {
                sh 'mvn clean test'
            }
        }

        stage('Package') {
            steps {
                sh 'mvn package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE}:latest")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDENTIALS) {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy Docker Container') {
            steps {
                script {
                    sh "docker rm -f ${CONTAINER_NAME} || true"
                    sh 'docker run -d --name banking -p 8081:8080 akku1999/banking:latest'
                }
            }
        }
    }
}
