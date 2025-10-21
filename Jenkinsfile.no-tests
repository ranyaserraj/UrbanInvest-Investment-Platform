pipeline {
    agent any
    
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
        
        stage('Package') {
            steps {
                echo '📦 Creating package...'
                sh 'mvn package -DskipTests'
                archiveArtifacts artifacts: 'target/*.war', fingerprint: true
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
