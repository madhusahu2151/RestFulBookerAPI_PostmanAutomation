pipeline {
    agent any

    tools {
        // This is the MAGIC part. It adds 'npm' and 'node' to your PATH.
        // Ensure this name matches the name in Manage Jenkins > Tools
        nodejs 'NodeJS 25.6.0' 
    }

    stages {
        stage('Install Newman') {
            steps {
                sh 'npm install -g newman newman-reporter-htmlextra'
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
