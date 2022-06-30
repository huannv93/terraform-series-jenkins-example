pipeline {
  agent any

  stages {
    stage('Install Terraform') {
      steps {
        sh 'chmod 755 ./tf-install.sh && ./tf-install.sh'
      }
    }
    stage('Init Provider') {
      steps {
        sh 'terraform -v'
      }
    }
  }
}
