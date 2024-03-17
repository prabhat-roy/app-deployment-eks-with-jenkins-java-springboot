def gv_script
pipeline {
    agent any
    environment {
        IMAGE_NAME = ""
        GITHUB_URL = "https://github.com/prabhat-roy/app-deployment-eks-with-jenkins-java-springboot.git"
    }
    tools {
        jdk 'Java'
        maven 'Maven'
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
        stage("Trivy FS Scan") {
            steps {
                script {
                    gv_script.trivyfs()
                }
            }
        }
        stage("Code Compile") {
            steps {
                script {
                    gv_script.codecompile()
                }
            }
        }
        stage("Building Application") {
            steps {
                script {
                    gv_script.buildapplication()
                }
            }
        }
        stage("Docker Build") {
            steps {
                script {
                    gv_script.dockerbuild()
                }
            }
        }
        stage("Trivy Image Scan") {
            steps {
                script {
                    gv_script.trivyimage()
                }
            }
        }
        stage("Docker Scout Image Scan") {
            steps {
                script {
                    gv_script.dockerscout()
                }
            }
        }
        stage("Grype Image Scan") {
            steps {
                script {
                    gv_script.grype()
                }
            }
        }
        stage("Syft Image Scan") {
            steps {
                script {
                    gv_script.syft()
                }
            }
        }
        stage("Docker Push ECR") {
            steps {
                script {
                    gv_script.ecr()
                }
            }
        }
        stage("Deployment to K8s") {
            steps {
                script {
                    gv_script.kubernetes()
                }
            }
        }
        stage("Container Removal") {
            steps {
                script {
                    gv_script.removedocker()
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