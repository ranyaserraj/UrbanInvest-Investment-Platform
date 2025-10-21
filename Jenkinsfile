pipeline {
    agent any
    
    environment {
        SONAR_HOST_URL = 'http://sonarqube:9000'
        SONAR_TOKEN = credentials('sonar-token')
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo '🔄 Cloning repository...'
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                echo '🔨 Building project...'
                sh '''
                    # Vérifier Java
                    java -version
                    
                    # Vérifier Maven
                    mvn -version
                    
                    # Build simple
                    mvn clean compile
                '''
            }
        }
        
        stage('Test') {
            steps {
                echo '🧪 Running tests...'
                sh 'mvn test'
            }
        }
        
        stage('Package') {
            steps {
                echo '📦 Creating package...'
                sh 'mvn package -DskipTests'
                archiveArtifacts artifacts: 'target/*.war', fingerprint: true
            }
        }
        
        stage('SonarQube Analysis') {
            steps {
                echo '🔍 Running SonarQube analysis...'
                script {
                    // Analyse SonarQube simple
                    sh '''
                        mvn sonar:sonar \
                            -Dsonar.projectKey=urbaninvest-platform \
                            -Dsonar.projectName=UrbanInvest Platform \
                            -Dsonar.sources=src/main/java \
                            -Dsonar.tests=src/test/java
                    '''
                }
            }
        }
    }
    
    post {
        always {
            echo '🧹 Cleaning up...'
        }
        success {
            echo '✅ Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed!'
        }
    }
}
