pipeline {
  agent any
  environment {
    GH_TOKEN   = credentials('github-token')
  }
  stages {
    stage('Install deps & Test') {
      steps {
        sh '''
          uv sync
        '''
      }
    }
    stage('Release') {
      when { branch 'master' } 
      steps {
        withCredentials([
          string(credentialsId: 'github-token', variable: 'GH_TOKEN'),
        ]) {
          sh '''
            git checkout ${BRANCH_NAME}

            export GH_TOKEN=$GH_TOKEN
            uv run semantic-release version
          '''
        }
      }
    }
  }
}