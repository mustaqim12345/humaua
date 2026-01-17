pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/mustaqim12345/humaua.git'
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Prepare Docker') {
            steps {
                // Copy jar to generic name
                sh 'cp target/demo-1.0.0.jar app.jar'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-java-app:latest .'
            }
        }

        stage('Stop Old Container') {
            steps {
                // Remove old container if exists
                sh 'docker rm -f my-java-container || true'
            }
        }

        stage('Run Docker Container') {
            steps {
                // Run container on host 8081 → container 8081
                sh 'docker run -d --name my-java-container -p 8081:8081 my-java-app:latest'
            }
        }
    }

    post {
        success {
            echo "Deployment successful! App running on port 8081."
        }
        failure {
            echo "Something went wrong. Check pipeline logs."
        }
    }
}
