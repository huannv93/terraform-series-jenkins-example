pipeline {
  agent any

  stages {
    stage('Init Provider') {
      steps {
        container('terraform') {
          sh 'terraform -v'
        }
      }
    }
  }
}
