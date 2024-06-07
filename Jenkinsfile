pipeline {
    agent any
    environment {
            DOCKERHUB_CREDENTIALS=credentials('dockerhub')
        }
        stages{
            stage('init'){
                steps{
                    sh 'docker rm -f $(docker ps -aq) || true'
                }
            }
            stage ('build'){
                steps{
                    sh 'chmod +x deploy.sh'
                    sh './deploy.sh'
                }
            }
            stage('push'){
                steps{
                    sh "echo \$DOCKERHUB_CREDENTIALS_PSW | docker login -u \$DOCKERHUB_CREDENTIALS_USR --password-stdin"
                    sh "docker tag mysql-lab-9-image urszulac/task2sql:latest"
                    sh "docker tag flask-app-lab-9-image urszulac/task2flask:latest"
                    sh "docker push urszulac/task2sql:latest"
                    sh "docker push urszulac/task2flask:latest"
                }

            }
        }
    }

