pipeline {
    agent any

    stages {
        stage('Install Newman') {
            steps {
                sh 'npm install -g newman'
            }
        }

        stage('Run API Tests') {
            steps {
                sh 'scripts/run_newman.sh'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'reports/*'
        }
    }
}