pipeline {
  agent any
  stages {
    stage('Sync') {
      steps {
        echo 'Sync'
      }
    }
    stage('Build') {
      steps {
        echo 'Build'
      }
    }
    stage('Archive') {
      steps {
        echo 'Archive'
      }
    }
    stage('Deliver') {
      steps {
        echo 'Deliver'
        sh deliver.sh
      }
    }
  }
}
