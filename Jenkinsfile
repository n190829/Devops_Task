pipeline {
    agent any

    environment {
        IMAGE_NAME = 'madhu794/devops_task_image'
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds') // Jenkins credentials ID
    }

    stages {
        stage('Checkout') {
            steps {
                // Ensure correct branch and URL
                git branch: 'main', url: 'https://github.com/n190829/Devops_Task.git'
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    dockerImage = docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Docker Login & Push') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDENTIALS) {
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }

    post {
        success {
            echo "✅ Build and push successful!"
        }
        failure {
            echo "❌ Build or push failed!"
        }
    }
}
