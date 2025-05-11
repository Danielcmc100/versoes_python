pipeline {
  agent any
  // GH_TOKEN é definido aqui para estar disponível em todo o pipeline se necessário,
  // mas withCredentials é usado para escopo mais restrito nos stages de release.
  environment {
    // Você pode remover esta linha se preferir usar withCredentials exclusivamente
    // GH_TOKEN_FROM_ENV = credentials('github-token') 
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
          # Adicione seus comandos de teste aqui, se houver
          # Ex: uv run pytest
        '''
      }
    }
    stage('Semantic Release - PR Check (Dry Run)') {
      when {
        // Executa este estágio apenas se a variável de ambiente CHANGE_ID existir (build de PR)
        environment name: 'CHANGE_ID', value: null, comparator: 'NOT_NULL'
      }
      steps {
        withCredentials([
          string(credentialsId: 'github-token', variable: 'GH_TOKEN_PR')
        ]) {
          sh '''
            echo "Running Semantic Release in --noop mode for PR: ${CHANGE_ID}"
            export GH_TOKEN=$GH_TOKEN_PR
            # Adicione --noop ou a flag de dry-run do seu semantic-release
            # Se 'version' já implica em dry-run em PRs para sua config, pode não ser necessário
            # mas explicitamente adicionar --noop é mais seguro.
            # Verifique a documentação do python-semantic-release para a flag correta de dry-run.
            # Assumindo que --noop é a flag correta:
            uv run semantic-release --noop version 
          '''
        }
      }
    }
    stage('Semantic Release - Publish') {
      when {
        // Executa apenas na branch 'main' (ou 'master') E NÃO é um PR
        branch 'master' // Mude para 'master' ou sua branch principal, se diferente
        environment name: 'CHANGE_ID', value: null, comparator: 'NULL'
      }
      steps {
        withCredentials([
          string(credentialsId: 'github-token', variable: 'GH_TOKEN_RELEASE')
        ]) {
          sh '''
            echo "Running Semantic Release to publish new version from branch ${GIT_BRANCH}"
            export GH_TOKEN=$GH_TOKEN_RELEASE
            uv run semantic-release version
          '''
        }
      }
    }
  }
  Adicione post actions se necessário, como notificações
  post {
    always {
      echo 'Pipeline finished.'
    }
    success {
      echo 'Pipeline succeeded!'
    }
    failure {
      echo 'Pipeline failed!'
    }
  }
}