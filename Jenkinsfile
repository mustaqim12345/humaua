pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "my-java-app:latest"
        CONTAINER_NAME = "my-java-container"
    }

    stages {
        stage('Checkout SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/mustaqim12345/humaua.git'
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Prepare Docker') {
            steps {
                sh 'cp target/demo-1.0.0.jar app.jar'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh 'docker rm -f $CONTAINER_NAME || true'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d --name $CONTAINER_NAME -p 8081:8081 $DOCKER_IMAGE'
            }
        }
    }
}
