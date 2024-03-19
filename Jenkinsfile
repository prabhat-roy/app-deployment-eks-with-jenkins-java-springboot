def gv_script
pipeline {
    agent any
    environment {
        registry = "873330726955.dkr.ecr.ap-south-2.amazonaws.com/test-repo"
        IMAGE_NAME = "873330726955.dkr.ecr.ap-south-2.amazonaws.com/test-repo"
        GITHUB_URL = "https://github.com/prabhat-roy/app-deployment-eks-with-jenkins-java-springboot.git"
    }
    tools {
        jdk 'Java'
        maven 'Maven3'
    }
    stages {
        stage("Init") {
            steps {
                script {
                    gv_script = load"script.groovy"
                }
            }
        }
        stage("Cleanup Workspace") {
            steps {
                script {
                    gv_script.cleanup()
                }
            }
        }
        stage("Checkout from Git Repo") {
            steps {
                script {
                    gv_script.checkout()
                }
            }
        }
        stage("OWASP FS Scan") {
            steps {
                script {
                    gv_script.owasp()
                }
            }
        }
                stage("SonarQube Analysis") {
            steps {
                script {
                    gv_script.sonaranalysis()
                }
            }
        }
    }
    post {
        always {
            sh "docker logout"
            deleteDir()
        }
    }
}