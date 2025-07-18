pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git 'https://github.com/n190829/Devops_Task'
            }
        }

        stage('Docker Build') {
            steps {
                bat 'docker build -t madhu794/devopstask .'
            }
        }

        stage('Docker Login') {
            steps {
                bat 'docker login -u madhu794'
            }
        }

        stage('Docker Push') {
            steps {
                bat 'docker push madhu794/devopstask:latest'
            }
        }
    }
}
