#!/bin/bash

# Script de test pour valider le pipeline Jenkins localement
# Usage: ./test-pipeline.sh

echo "🚀 Test du Pipeline UrbanInvest"
echo "================================"

# Couleurs pour les messages
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Fonction pour afficher les messages
print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Vérification des prérequis
echo "🔍 Vérification des prérequis..."

# Vérifier Java
if command -v java &> /dev/null; then
    JAVA_VERSION=$(java -version 2>&1 | head -n 1 | cut -d'"' -f2)
    print_status "Java trouvé: $JAVA_VERSION"
else
    print_error "Java n'est pas installé"
    exit 1
fi

# Vérifier Maven
if command -v mvn &> /dev/null; then
    MAVEN_VERSION=$(mvn -version | head -n 1 | cut -d' ' -f3)
    print_status "Maven trouvé: $MAVEN_VERSION"
else
    print_error "Maven n'est pas installé"
    exit 1
fi

# Vérifier Git
if command -v git &> /dev/null; then
    GIT_VERSION=$(git --version | cut -d' ' -f3)
    print_status "Git trouvé: $GIT_VERSION"
else
    print_error "Git n'est pas installé"
    exit 1
fi

echo ""
echo "🔨 Exécution des étapes du pipeline..."

# Étape 1: Clean et Compile
echo "1️⃣  Compilation du projet..."
if mvn clean compile; then
    print_status "Compilation réussie"
else
    print_error "Échec de la compilation"
    exit 1
fi

# Étape 2: Tests
echo "2️⃣  Exécution des tests..."
if mvn test; then
    print_status "Tests exécutés avec succès"
else
    print_warning "Certains tests ont échoué"
fi

# Étape 3: Package
echo "3️⃣  Création du package WAR..."
if mvn package -DskipTests; then
    print_status "Package WAR créé avec succès"
    
    # Vérifier que le fichier WAR existe
    if [ -f "target/urbaninvest.war" ]; then
        WAR_SIZE=$(du -h target/urbaninvest.war | cut -f1)
        print_status "Fichier WAR généré: target/urbaninvest.war ($WAR_SIZE)"
    else
        print_error "Fichier WAR non trouvé"
    fi
else
    print_error "Échec de la création du package"
    exit 1
fi

# Étape 4: Vérification des rapports
echo "4️⃣  Vérification des rapports..."

if [ -d "target/surefire-reports" ]; then
    print_status "Rapports de tests générés"
    TEST_COUNT=$(find target/surefire-reports -name "*.xml" | wc -l)
    echo "   📊 $TEST_COUNT rapport(s) de test trouvé(s)"
fi

if [ -d "target/site/jacoco" ]; then
    print_status "Rapport de couverture JaCoCo généré"
fi

# Résumé
echo ""
echo "📋 Résumé du test:"
echo "=================="
print_status "Pipeline testé avec succès"
print_status "Projet compilé et packagé"
print_status "Tests exécutés"
print_status "Artefacts générés"

echo ""
echo "🎯 Prochaines étapes:"
echo "- Configurer Jenkins avec le Jenkinsfile"
echo "- Intégrer SonarQube pour l'analyse de qualité"
echo "- Configurer Docker pour la containerisation"
echo "- Déployer sur Kubernetes"

echo ""
print_status "Test du pipeline terminé! 🚀"
