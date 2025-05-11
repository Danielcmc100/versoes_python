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
      // Condicional para executar apenas em branches específicas, se necessário
      // Exemplo: when { branch 'main' } ou when { branch 'master' }
      steps {
        withCredentials([
          string(credentialsId: 'github-token', variable: 'GH_TOKEN'),
        ]) {
          sh '''
            # Garante que estamos na branch correta e não em detached HEAD
            # Isso é crucial para o semantic-release
            git checkout ${BRANCH_NAME}

            # Configurar o usuário git para o semantic-release poder fazer commits (se necessário)
            # Se o semantic-release for fazer commit (ex: changelog, package.json version bump)
            git config --global user.email "jenkins@example.com" 
            git config --global user.name "Jenkins CI"

            export GH_TOKEN=$GH_TOKEN
            uv run semantic-release version
          '''
        }
      }
    }
  }
}