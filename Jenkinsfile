// example about Parallel stages Jenkins
pipeline {
  agent any

  tools {
    terraform 'Terraform configuration'
  }

  environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-secret-key-id-tutaojenkins')
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key-tutaojenkins')
  }


  stages {
    stage('Init Provider') {
      steps {
        sh 'terraform init'
      }
    }
    stage('Plan Resources') {
      steps {
        sh 'terraform plan'
      }
    }

    stage('Appy or Destroy Infratruction') {
        parallel {
            stage('Apply Resources') {
              input {
                message "Do you want to proceed for production deployment?"
              }
                steps {
                    sh 'terraform apply -auto-approve'
                }

            }
            stage('Destroy Resources') {
              input {
                message "Do you want to destroy for production deployment?"
              }
                steps {
                    sh 'terraform destroy -auto-approve'
                }
            }
        }
     }
  }
  }