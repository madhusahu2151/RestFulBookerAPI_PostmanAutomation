pipeline {
    agent any

    tools {
        // This is the MAGIC part. It adds 'npm' and 'node' to your PATH.
        // Ensure this name matches the name in Manage Jenkins > Tools
        nodejs 'NodeJS 25.6.0' 
    }

   stages {
        stage('Cleanup') {
            steps {
                // Clean up old reports before starting a new run
                sh 'rm -rf reports node_modules'
            }
        }

        stage('Install Newman & Reporter') {
            steps {
                // Installing locally (without -g) prevents permission errors on Mac
                sh 'npm install newman newman-reporter-htmlextra'
            }
        }

        stage('Run API Tests') {
            steps {
                sh 'mkdir -p reports'
                
                // We use '|| true' so that even if assertions fail, 
                // the pipeline continues to the 'post' section to save the report.
                script {
                    sh '''
                    ./node_modules/.bin/newman run RestFullBooker_Newman.postman_collection.json \
                    -e environments/qa.json \
                    -r htmlextra \
                    --reporter-htmlextra-export reports/report.html || true
                    '''
                }
            }
        }
    }

    post {
        always {
            // This captures the HTML report so you can download it from the Jenkins UI
            archiveArtifacts artifacts: 'reports/*.html', allowEmptyArchive: true
            
            echo "Build finished. Check the Artifacts section for the Newman Report."
        }
    }
}
