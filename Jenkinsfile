pipeline {
    agent any

    environment {
        // Variables pour SonarQube
        SONAR_PROJECT_KEY = 'urbaninvest-platform'
        SONAR_PROJECT_NAME = 'UrbanInvest Platform'
        SONAR_HOST_URL = 'http://sonarqube:9000'
    }

    stages {
        // ========================================
        // ÉTAPE 1: CHECKOUT - Cloner le repository
        // ========================================
        stage('1. Checkout') {
            steps {
                echo '🔄 Clonage du repository GitHub...'
                checkout scm
                script {
                    def gitCommit = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
                    def gitBranch = sh(returnStdout: true, script: 'git rev-parse --abbrev-ref HEAD').trim()
                    echo "📋 Commit: ${gitCommit}"
                    echo "🌿 Branche: ${gitBranch}"
                }
            }
        }

        // ========================================
        // ÉTAPE 2: BUILD - Compiler le projet
        // ========================================
        stage('2. Build') {
            steps {
                echo '🔨 Compilation du projet Maven...'
                script {
                    if (fileExists('mvnw')) {
                        sh './mvnw clean compile'
                    } else {
                        sh 'mvn clean compile'
                    }
                }
            }
        }

        // ========================================
        // ÉTAPE 3: PACKAGE - Générer le WAR
        // ========================================
        stage('3. Package') {
            steps {
                echo '📦 Génération du package WAR...'
                script {
                    if (fileExists('mvnw')) {
                        sh './mvnw package -DskipTests'
                    } else {
                        sh 'mvn package -DskipTests'
                    }
                }
            }
            post {
                always {
                    archiveArtifacts artifacts: 'target/*.war', fingerprint: true
                }
            }
        }

        // ========================================
        // ÉTAPE 4: SONARQUBE - Analyse qualité
        // ========================================
        stage('4. SonarQube Analysis') {
            steps {
                echo '🔍 Analyse de la qualité du code avec SonarQube...'
                withCredentials([string(credentialsId: 'sonar-token', variable: 'SONAR_TOKEN')]) {
                    script {
                        if (fileExists('mvnw')) {
                            sh "./mvnw sonar:sonar -Dsonar.projectKey=${SONAR_PROJECT_KEY} -Dsonar.projectName='${SONAR_PROJECT_NAME}' -Dsonar.host.url=${SONAR_HOST_URL} -Dsonar.token=${SONAR_TOKEN}"
                        } else {
                            sh "mvn sonar:sonar -Dsonar.projectKey=${SONAR_PROJECT_KEY} -Dsonar.projectName='${SONAR_PROJECT_NAME}' -Dsonar.host.url=${SONAR_HOST_URL} -Dsonar.token=${SONAR_TOKEN}"
                        }
                    }
                }
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline exécuté avec succès !'
            echo '📦 Package WAR généré'
            echo '🔍 Analyse SonarQube terminée'
            
            // Notification de succès
            script {
                echo "🔗 URLs d'accès :"
                echo "   Jenkins: http://localhost:8081"
                echo "   SonarQube: http://localhost:9000"
                echo "   Rapport SonarQube: http://sonarqube:9000/dashboard?id=urbaninvest-platform"
            }
        }
        failure {
            echo '❌ Pipeline échoué !'
            echo '🧹 Vérifiez les logs pour plus de détails'
        }
        always {
            echo '📋 Pipeline terminé'
        }
    }
}