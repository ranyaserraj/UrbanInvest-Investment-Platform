pipeline {
    agent any
    
    tools {
        maven 'Maven-3.8.6'
        jdk 'JDK-8'
    }
    
    environment {
        SONAR_HOST_URL = 'http://localhost:9000'
        SONAR_TOKEN = credentials('sonar-token')
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
        DOCKER_IMAGE_NAME = 'urbaninvest/urbaninvest-platform'
        DOCKER_IMAGE_TAG = "${BUILD_NUMBER}"
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo '🔄 Cloning repository...'
                checkout scm
                script {
                    env.GIT_COMMIT_SHORT = sh(
                        script: 'git rev-parse --short HEAD',
                        returnStdout: true
                    ).trim()
                }
            }
        }
        
        stage('Build') {
            steps {
                echo '🔨 Building project with Maven...'
                sh 'mvn clean compile'
            }
        }
        
        stage('Test') {
            steps {
                echo '🧪 Running unit tests...'
                sh 'mvn test'
            }
            post {
                always {
                    echo '📊 Publishing test results...'
                    publishTestResults testResultsPattern: 'target/surefire-reports/*.xml'
                    publishHTML([
                        allowMissing: false,
                        alwaysLinkToLastBuild: true,
                        keepAll: true,
                        reportDir: 'target/surefire-reports',
                        reportFiles: 'index.html',
                        reportName: 'Test Report'
                    ])
                }
            }
        }
        
        stage('Package') {
            steps {
                echo '📦 Creating WAR package...'
                sh 'mvn package -DskipTests'
                archiveArtifacts artifacts: 'target/*.war', fingerprint: true
            }
        }
        
        stage('SonarQube Analysis') {
            steps {
                echo '🔍 Running SonarQube analysis...'
                withSonarQubeEnv('SonarQube') {
                    sh 'mvn sonar:sonar \
                        -Dsonar.projectKey=urbaninvest-platform \
                        -Dsonar.projectName=UrbanInvest Platform \
                        -Dsonar.projectVersion=${BUILD_NUMBER} \
                        -Dsonar.sources=src/main/java \
                        -Dsonar.tests=src/test/java \
                        -Dsonar.java.binaries=target/classes \
                        -Dsonar.coverage.jacoco.xmlReportPaths=target/site/jacoco/jacoco.xml'
                }
            }
        }
        
        stage('Quality Gate') {
            steps {
                echo '🚪 Waiting for SonarQube Quality Gate...'
                timeout(time: 10, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
        
        stage('Docker Build') {
            steps {
                echo '🐳 Building Docker image...'
                script {
                    def image = docker.build("${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}")
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        image.push()
                        image.push('latest')
                    }
                }
            }
        }
        
        stage('Deploy to Kubernetes') {
            when {
                branch 'main'
            }
            steps {
                echo '🚀 Deploying to Kubernetes...'
                script {
                    sh """
                        kubectl set image deployment/urbaninvest-app urbaninvest-app=${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}
                        kubectl rollout status deployment/urbaninvest-app
                    """
                }
            }
        }
    }
    
    post {
        always {
            echo '🧹 Cleaning up workspace...'
            cleanWs()
        }
        success {
            echo '✅ Pipeline completed successfully!'
            emailext (
                subject: "✅ Build Success: UrbanInvest Platform #${BUILD_NUMBER}",
                body: """
                    <h2>Build Successful!</h2>
                    <p><strong>Project:</strong> UrbanInvest Platform</p>
                    <p><strong>Build Number:</strong> ${BUILD_NUMBER}</p>
                    <p><strong>Git Commit:</strong> ${env.GIT_COMMIT_SHORT}</p>
                    <p><strong>Branch:</strong> ${env.BRANCH_NAME}</p>
                    <p><strong>Build URL:</strong> ${BUILD_URL}</p>
                """,
                to: 'devops-team@urbaninvest.com'
            )
        }
        failure {
            echo '❌ Pipeline failed!'
            emailext (
                subject: "❌ Build Failed: UrbanInvest Platform #${BUILD_NUMBER}",
                body: """
                    <h2>Build Failed!</h2>
                    <p><strong>Project:</strong> UrbanInvest Platform</p>
                    <p><strong>Build Number:</strong> ${BUILD_NUMBER}</p>
                    <p><strong>Git Commit:</strong> ${env.GIT_COMMIT_SHORT}</p>
                    <p><strong>Branch:</strong> ${env.BRANCH_NAME}</p>
                    <p><strong>Build URL:</strong> ${BUILD_URL}</p>
                    <p><strong>Console Output:</strong> ${BUILD_URL}console</p>
                """,
                to: 'devops-team@urbaninvest.com'
            )
        }
        unstable {
            echo '⚠️ Pipeline completed with warnings!'
        }
    }
}
