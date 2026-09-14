pipeline {
    agent any

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

        stage('Docker Login') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-credentials',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASSWORD'
                    )
                ]) {
                    sh '''
                        echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USER}" --password-stdin
                    '''
                }
            }
        }

        stage('Push DEV Image') {
            when {
                branch 'dev'
            }
            steps {
                echo 'Pushing DEV image...'
                sh '''
                    docker tag devops-app:latest bhawani608/project3-dev:latest
                    docker push bhawani608/project3-dev:latest
                '''
            }
        }

        stage('Push PROD Image') {
            when {
                branch 'master'
            }
            steps {
                echo 'Pushing PROD image...'
                sh '''
                    docker tag devops-app:latest bhawani608/project3-prod:latest
                    docker push bhawani608/project3-prod:latest
                '''
            }
        }

        stage('Docker Logout') {
            steps {
                sh 'docker logout'
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully for branch: ${env.BRANCH_NAME}"
        }

        failure {
            echo "Pipeline failed for branch: ${env.BRANCH_NAME}"
        }
    }
}
