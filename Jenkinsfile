
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'DevOpsX 2.0: Starting pipeline!'
                checkout scm
            }
        }

        stage('Validate Files') {
            steps {
                script {
                    if (fileExists('index.html') &&
                        fileExists('Dockerfile')) {
                        echo 'SUCCESS: Required files found!'
                    } else {
                        error 'Required files are missing!'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t devopsx-dashboard:1.0 .'
            }
        }

        stage('Deploy Website') {
            steps {
                bat '''
                docker rm -f devopsx-deploy 2>NUL
                docker run -d --name devopsx-deploy -p 8083:80 devopsx-dashboard:1.0
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                bat 'docker ps --filter "name=devopsx-deploy"'
                echo 'Deployment stage completed!'
            }
        }
    }

    post {
        success {
            echo 'BUILD SUCCESSFUL!'
        }
        failure {
            echo 'BUILD FAILED. Check the console output.'
        }
    }
}
