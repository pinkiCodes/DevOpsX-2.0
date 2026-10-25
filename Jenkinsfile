
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

        stage('Pipeline Complete') {
            steps {
                echo 'DevOpsX 2.0 pipeline completed successfully!'
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
