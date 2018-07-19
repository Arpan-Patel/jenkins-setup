pipeline {
  agent any
  stages {
    stage('Sync') {
      steps {
        echo 'Sync'
        sh 'echo "Sync"'
        ./sync.sh
      }
    }
    stage('Build') {
      steps {
        echo 'Build'
        sh 'echo "Build"'
        ./build.sh
      }
    }
    stage('Archive') {
      steps {
        echo 'Archive'
        sh 'echo "Archive"'
        ./archive.sh
      }
    }
    stage('Deliver') {
      steps {
        echo 'Deliver'
        sh 'echo "Deliver"'
        ./deliver.sh
      }
    }
  }
}
