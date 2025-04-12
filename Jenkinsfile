pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                dir('/home/ubuntu/devops-build/build/') {
                    sh 'chmod +x build.sh deploy.sh'
                    sh './build.sh'
                }
            }
        }
        stage('Deploy to Dev') {
            when { branch 'dev' }
            steps {
                dir('/home/ubuntu/devops-build/build/') {
                    sh './deploy.sh dev'
                }
            }
        }
        stage('Deploy to Prod') {
            when { branch 'main' }
            steps {
                dir('/home/ubuntu/devops-build/build/') {
                    sh './deploy.sh prod'
                }
            }
        }
    }
}
