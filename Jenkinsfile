pipeline {

    agent any

    stages {

        stage('Clone') {
            steps {
                git 'https://github.com/NillaCom/ms-nillacomm-configuration-server.git'
            }
        }

        stage('Maven Build') { 
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps { 
                script {
                    app = docker.build("springboot-app") 
                }
            }
        }

        stage('Push to ECR') {
            steps {
                script {
                    docker.withRegistry('558084781079.dkr.ecr.eu-west-1.amazonaws.com/nilla/configserver', 'ecr:us-east-1:credentials') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }

    }

}
