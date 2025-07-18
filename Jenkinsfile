pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/n190829/Devops_Task.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t madhu794/devopstask:latest .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh 'docker push madhu794/devopstask:latest'
                }
            }
        }

        stage('Run Container (Optional)') {
            steps {
                sh 'docker run -d -p 8080:80 madhu794/devopstask:latest'
            }
        }
    }
}
