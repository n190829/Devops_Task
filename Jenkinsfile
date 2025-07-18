pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/n190829/Devops_Task.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat'docker build -t madhu794/devopstask:latest .'
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
                // Stop any container using port 8080
                sh '''
                    docker ps -q --filter "publish=8080" | grep -q . && docker ps -q --filter "publish=8080" | xargs docker stop || echo "No container on port 8080"
                '''
                // Start fresh container
                sh 'docker run -d -p 8080:80 madhu794/devopstask:latest'
            }
        }
    }
}
