pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'bhawani608'
        DEV_IMAGE = 'bhawani608/project3-dev:latest'
    }

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out source code...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh './build.sh'
            }
        }

        stage('Tag Docker Image') {
            steps {
                echo 'Tagging image for Docker Hub...'
                sh '''
                    docker tag devops-app:latest ${DEV_IMAGE}
                '''
            }
        }

        stage('Push to Docker Hub - DEV') {
            steps {
                echo 'Pushing DEV image to Docker Hub...'

                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-credentials',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASSWORD'
                    )
                ]) {
                    sh '''
                        echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USER}" --password-stdin
                        docker push ${DEV_IMAGE}
                        docker logout
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'DEV deployment pipeline completed successfully.'
        }

        failure {
            echo 'DEV pipeline failed.'
        }
    }
}
