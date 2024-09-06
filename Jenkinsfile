pipeline {
    agent any

    environment {
        // Define your AWS region and other environment variables
        AWS_REGION = 'us-east-1'
        DEPLOYMENT_GROUP = 'deploy-cd-1'
        APPLICATION_NAME = 'deploy-cd'
        BUCKET_NAME = 'deploy-cd'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Set Up Virtual Environment') {
            steps {
                script {
                    sh 'python3 -m venv $VENV_DIR'
                    sh '$VENV_DIR/bin/pip install --upgrade pip'  // Upgrade pip to the latest version
                }
            }
        }

        
        stage('Install Dependencies') {
            steps {
                script {
                    sh '$VENV_DIR/bin/pip install -r requirements.txt'
                }
            }
        }
        
        stage('Package') {
            steps {
                // Package your application
                script {
                    sh 'zip -r myapp.zip .'
                }
            }
        }

        stage('Upload to S3') {
            steps {
                script {
                    // Upload the package to S3
                    sh 'aws s3 cp myapp.zip s3://$BUCKET_NAME/myapp.zip --region $AWS_REGION'
                }
            }
        }
        
        stage('Deploy to AWS CodeDeploy') {
            steps {
                script {
                    // Trigger a deployment
                    sh 'aws deploy create-deployment --application-name $APPLICATION_NAME --deployment-group-name $DEPLOYMENT_GROUP --s3-location bucket=$BUCKET_NAME,key=myapp.zip,bundleType=zip --region $AWS_REGION'
                }
            }
        }
    }
    
    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
