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
    stage('Setup Python & UV') {
      steps {
        sh '''
          python -m venv .venv
          .venv/bin/pip install --upgrade uv
        '''
      }
    }
    stage('Install deps & Test') {
      steps {
        sh '''
          .venv/bin/uv install
          .venv/bin/uv run pytest
        '''
      }
    }
    stage('Release') {
      steps {
        withCredentials([
          string(credentialsId: 'github-token', variable: 'GH_TOKEN'),
          string(credentialsId: 'pypi-token', variable: 'PYPI_TOKEN')
        ]) {
          sh '''
            export GITHUB_TOKEN=$GH_TOKEN
            export PYPI_TOKEN=$PYPI_TOKEN
            .venv/bin/uv run semantic-release publish
          '''
        }
      }
    }
  }
}