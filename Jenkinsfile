def appName

pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    appName = sh(script: 'mvn -q exec:exec -Dexec.executable=echo -Dexec.args=\'${project.artifactId}\'', returnStdout: true).trim()
                    echo "Application Name: $appName"

                    sh 'mvn clean install'
                }
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    def version = sh(script: 'mvn help:evaluate -Dexpression=project.version -q -DforceStdout', returnStdout: true).trim()
                    def imageTag = "${appName}:${version}"

                    docker.build(imageTag, '.')
                    docker.withRegistry('https://558084781079.dkr.ecr.eu-west-1.amazonaws.com/nilla', 'ecr:eu-west-1:EcrCredentials') {
                        docker.image(imageTag).push()
                    }
                }
            }
        }
    }
}
