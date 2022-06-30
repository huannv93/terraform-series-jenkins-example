pipeline {
  agent any

  stages {
    stage('Install Terraform') {
      steps {
        sh './tf-install.sh'
      }
    }
    stage('Init Provider') {
      steps {
        sh 'terraform -v'
      }
    }
  }
}
