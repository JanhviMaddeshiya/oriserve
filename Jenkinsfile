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
        
        stage('Build') {
            steps {
                // Install dependencies and run tests
                script {
                    sh 'pip install -r requirements.txt'
                    //sh 'pytest'
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
