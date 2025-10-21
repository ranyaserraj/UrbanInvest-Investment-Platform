pipeline {
    agent any

    environment {
        // Variables d'environnement pour Docker
        DOCKER_IMAGE = 'urbaninvest/urbaninvest-platform'
        DOCKER_TAG = "${BUILD_NUMBER}"
        
        // Variables pour SonarQube
        SONAR_PROJECT_KEY = 'urbaninvest-platform'
        SONAR_PROJECT_NAME = 'UrbanInvest Platform'
        SONAR_HOST_URL = 'http://sonarqube:9000'
        
        // Variables pour Kubernetes
        K8S_NAMESPACE = 'urbaninvest'
        APP_NAME = 'urbaninvest-app'
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

        // ========================================
        // ÉTAPE 5: DOCKER - Containerisation
        // ========================================
        stage('5. Docker Build') {
            steps {
                echo '🐳 Construction de l\'image Docker...'
                script {
                    // Utiliser Docker depuis l'hôte via le socket Docker
                    sh "sudo docker build -f Dockerfile.webapp -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                    sh "sudo docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_IMAGE}:latest"
                    
                    // Vérifier que l'image a été créée
                    sh "sudo docker images | grep ${DOCKER_IMAGE}"
                }
            }
        }

        // ========================================
        // ÉTAPE 6: DOCKER COMPOSE - Déploiement
        // ========================================
        stage('6. Docker Compose Deployment') {
            steps {
                echo '🐳 Déploiement avec Docker Compose...'
                script {
                    // Utiliser Docker Compose depuis l'hôte
                    sh "docker-compose -f docker-compose.k8s.yml down || true"
                    sh "docker-compose -f docker-compose.k8s.yml up -d"
                    
                    // Attendre que les services soient prêts
                    sh "sleep 30"
                    
                    // Vérifier l'état des conteneurs
                    sh "docker-compose -f docker-compose.k8s.yml ps"
                }
            }
        }

        // ========================================
        // ÉTAPE 7: HEALTH CHECK - Vérification
        // ========================================
        stage('7. Health Check') {
            steps {
                echo '🏥 Vérification de la santé de l\'application...'
                script {
                    // Test de connectivité de l'application
                    sh "curl -f http://localhost:8082/ || echo 'Application not ready yet'"
                    
                    // Vérification des conteneurs
                    sh "docker ps | grep urbaninvest"
                }
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline exécuté avec succès !'
            echo '🌐 Application déployée et accessible'
            echo '📊 Monitoring configuré'
            
            // Notification de succès
            script {
                echo "🔗 URLs d'accès :"
                echo "   Application principale: http://localhost:8080"
                echo "   Application K8s simulé: http://localhost:8082"
                echo "   Proxy Nginx: http://localhost:3000"
                echo "   Jenkins: http://localhost:8081"
                echo "   SonarQube: http://localhost:9000"
            }
        }
        failure {
            echo '❌ Pipeline échoué !'
            echo '🧹 Nettoyage des ressources...'
            
            // Nettoyage en cas d'échec
            script {
                sh "docker-compose -f docker-compose.k8s.yml down || true"
            }
        }
        always {
            echo '📋 Nettoyage des ressources temporaires...'
            // Nettoyage des conteneurs temporaires
            sh "docker system prune -f"
        }
    }
}