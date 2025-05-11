pipeline {
  agent any
  environment {
    GH_TOKEN   = credentials('github-token')
    PYPI_TOKEN = credentials('pypi-token')
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
            export GITHUB_TOKEN=$GH_TOKEN
            uv run semantic-release version
          '''
        }
      }
    }
  }
}