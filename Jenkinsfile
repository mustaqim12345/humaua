pipeline {
pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                cp target/*.jar app.jar
                docker build -t my-java-app:latest .
                '''
            }
        }

        stage('Stop Old Container') {
            steps {
                sh 'docker rm -f my-java-container || true'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d --name my-java-container -p 8081:8080 --restart always my-java-app:latest'
            }
        }
    }
}
