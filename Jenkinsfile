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

    stage('Run Tests') {
        parallel {
            stage('Test On Windows') {
                agent {
                    label "windows"
                }
                steps {
                    bat "run-tests.bat"
                }
                post {
                    always {
                        junit "**/TEST-*.xml"
                    }
                }
            }
            stage('Test On Linux') {
                agent {
                    label "linux"
                }
                steps {
                    sh "run-tests.sh"
                }
                post {
                    always {
                        junit "**/TEST-*.xml"
                    }
                }
            }
    stage('Apply Resources') {
        when {
            expression {
                return ApplyResources.toBoolean()
            }
        }
      // set ApplyResources.toBoolean trong config jenkins : Boolean Parameter

      steps {
        sh 'terraform apply -auto-approve'

      }
    }
    stage('Destroy Resources') {
        when {
            expression {
                return DestroyResources.toBoolean()
            }
        }
      steps {
        sh 'terraform destroy -auto-approve'
      }
    }
  }
