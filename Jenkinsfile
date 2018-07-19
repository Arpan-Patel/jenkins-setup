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
        sh '''DIR_NAME=Rel_$BUILD_ID-`date +%d-%m-%Y`
sleep 3

DIR_NAME=Rel_$BUILD_ID-`date +%d-%m-%Y`

sleep 3


DIR_NAME=Rel_$BUILD_ID-`date +%d-%m-%Y`'''
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