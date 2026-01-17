pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-java-app:latest .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                if [ "$(docker ps -q -f name=my-java-container)" ]; then
                  docker stop my-java-container
                  docker rm my-java-container
                fi
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker run -d \
                --name my-java-container \
                -p 8081:8081 \
                --restart always \
                my-java-app:latest
                '''
            }
        }
    }
}

