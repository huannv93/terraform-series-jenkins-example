pipeline {
  agent any

  tools {
    terraform 'terraform'
  }

  stages {
    stage('Init Provider') {
      steps {
        sh 'terraform -v'
      }
    }
  }
}
