pipeline {
  agent any
  environment {
    GH_TOKEN   = credentials('github-token')
  }
  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Install deps & Test') {
      steps {
        sh '''
          uv sync
        '''
      }
    }
    stage('Release') {
      steps {
        withCredentials([
          string(credentialsId: 'github-token', variable: 'GH_TOKEN'),
        ]) {
          sh '''
            export GH_TOKEN=$GH_TOKEN
            uv run semantic-release version
          '''
        }
      }
    }
  }
}