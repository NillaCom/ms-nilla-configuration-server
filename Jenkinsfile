def timestamp
def repoName = 'ms-nilla-configuration-server'

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
                    // Get the current timestamp
                    timestamp = sh(script: 'date "+%Y%m%d%H%M%S"', returnStdout: true).trim()

                    echo "Timestamp: $timestamp"

                    sh 'mvn clean install'
                }
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    def imageTag = "dev-${timestamp}"

                    docker.build("${repoName}:${imageTag}", '.')
                    docker.withRegistry('https://558084781079.dkr.ecr.eu-west-1.amazonaws.com', 'ecr:eu-west-1:EcrCredentials') {
                        docker.image("${repoName}:${imageTag}").push()
                    }
                }
            }
        }
    }
}

// // this worked


// pipeline {
//     agent any

//     environment {
//         AWS_DEFAULT_REGION = 'eu-west-1'
//         ECR_REPO = '558084781079.dkr.ecr.eu-west-1.amazonaws.com/ms-nillacomm-menu-options'
//         IMAGE_NAME_PREFIX = 'dev-'
//         TIMESTAMP = new Date().format("yyyyMMdd-HHmmss")
//         IMAGE_NAME = "${IMAGE_NAME_PREFIX}${TIMESTAMP}"
//     }

//     stages {
//         stage('Checkout') {
//             steps {
//                 checkout scm
//             }
//         }

//         stage('Build and Push to ECR') {
//             steps {
//                 script {
//                     // Authenticate Docker with AWS ECR
//                     withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'ecr:eu-west-1:EcrCredentials', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
//                         def ecrLogin = sh(script: "aws ecr get-login-password --region ${AWS_DEFAULT_REGION}", returnStdout: true).trim()
//                         sh(script: "${ecrLogin}")
//                     }

//                     // Build Docker image
//                     sh(script: "docker build -t ${IMAGE_NAME} .")

//                     // Tag Docker image for AWS ECR
//                     sh(script: "docker tag ${IMAGE_NAME} ${ECR_REPO}/${IMAGE_NAME}")

//                     // Push Docker image to AWS ECR
//                     sh(script: "docker push ${ECR_REPO}/${IMAGE_NAME}")
//                 }
//             }
//         }
//     }

//     post {
//         success {
//             echo 'Image built and pushed successfully!'
//         }
//         failure {
//             echo 'Image build and push failed.'
//         }
//     }
// }



// def appName

// pipeline {
//     agent any

//     stages {
//         stage('Checkout') {
//             steps {
//                 checkout scm
//             }
//         }

//         stage('Build') {
//             steps {
//                 script {
//                     appName = sh(script: 'mvn -q exec:exec -Dexec.executable=echo -Dexec.args=\'${project.artifactId}\'', returnStdout: true).trim()
//                     echo "Application Name: $appName"

//                     sh 'mvn clean install'
//                 }
//             }
//         }

//         stage('Build and Push Docker Image') {
//             steps {
//                 script {
//                     def version = sh(script: 'mvn help:evaluate -Dexpression=project.version -q -DforceStdout', returnStdout: true).trim()
//                     def imageTag = "${appName}:${version}"

//                     docker.build(imageTag, '.')
//                     docker.withRegistry('https://558084781079.dkr.ecr.eu-west-1.amazonaws.com', 'ecr:eu-west-1:EcrCredentials') {
//                         docker.image(imageTag).push()
//                     }
//                 }
//             }
//         }
//     }
// }
