pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/JanhviMaddeshiya/oriserve.git'
            }
        }

        stage('Clone Repository') {
            steps {
                // Pull the latest code from the GitHub repository
                git branch: 'main', url: 'https://github.com/JanhviMaddeshiya/oriserve.git'
            }
        }

        stage('Set up Python Environment') {
            steps {
                sh '''
                    python3 -m venv venv
                    source venv/bin/activate
                    pip install -r requirements.txt
                '''
            }
        }

    }

    post {
        always {
            // Clean up the workspace after the build
            cleanWs()
        }

        success {
            echo 'Build completed successfully!'
        }

        failure {
            echo 'Build failed!'
        }
    }
}
