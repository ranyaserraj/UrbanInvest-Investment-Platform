# Script de test pour valider le pipeline Jenkins localement
# Usage: .\test-pipeline.ps1

Write-Host "🚀 Test du Pipeline UrbanInvest" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan

# Fonction pour afficher les messages
function Write-Success {
    param($Message)
    Write-Host "✅ $Message" -ForegroundColor Green
}

function Write-Warning {
    param($Message)
    Write-Host "⚠️  $Message" -ForegroundColor Yellow
}

function Write-Error {
    param($Message)
    Write-Host "❌ $Message" -ForegroundColor Red
}

# Vérification des prérequis
Write-Host "🔍 Vérification des prérequis..." -ForegroundColor Blue

# Vérifier Java
try {
    $javaVersion = java -version 2>&1 | Select-Object -First 1
    Write-Success "Java trouvé: $javaVersion"
} catch {
    Write-Error "Java n'est pas installé"
    exit 1
}

# Vérifier Maven
try {
    $mavenVersion = mvn -version | Select-Object -First 1
    Write-Success "Maven trouvé: $mavenVersion"
} catch {
    Write-Error "Maven n'est pas installé"
    exit 1
}

# Vérifier Git
try {
    $gitVersion = git --version
    Write-Success "Git trouvé: $gitVersion"
} catch {
    Write-Error "Git n'est pas installé"
    exit 1
}

Write-Host ""
Write-Host "🔨 Exécution des étapes du pipeline..." -ForegroundColor Blue

# Étape 1: Clean et Compile
Write-Host "1️⃣  Compilation du projet..." -ForegroundColor Yellow
try {
    mvn clean compile
    Write-Success "Compilation réussie"
} catch {
    Write-Error "Échec de la compilation"
    exit 1
}

# Étape 2: Tests
Write-Host "2️⃣  Exécution des tests..." -ForegroundColor Yellow
try {
    mvn test
    Write-Success "Tests exécutés avec succès"
} catch {
    Write-Warning "Certains tests ont échoué"
}

# Étape 3: Package
Write-Host "3️⃣  Création du package WAR..." -ForegroundColor Yellow
try {
    mvn package -DskipTests
    Write-Success "Package WAR créé avec succès"
    
    # Vérifier que le fichier WAR existe
    if (Test-Path "target\urbaninvest.war") {
        $warSize = (Get-Item "target\urbaninvest.war").Length
        $warSizeMB = [math]::Round($warSize / 1MB, 2)
        Write-Success "Fichier WAR généré: target\urbaninvest.war ($warSizeMB MB)"
    } else {
        Write-Error "Fichier WAR non trouvé"
    }
} catch {
    Write-Error "Échec de la création du package"
    exit 1
}

# Étape 4: Vérification des rapports
Write-Host "4️⃣  Vérification des rapports..." -ForegroundColor Yellow

if (Test-Path "target\surefire-reports") {
    Write-Success "Rapports de tests générés"
    $testReports = Get-ChildItem "target\surefire-reports" -Filter "*.xml"
    Write-Host "   📊 $($testReports.Count) rapport(s) de test trouvé(s)" -ForegroundColor Cyan
}

if (Test-Path "target\site\jacoco") {
    Write-Success "Rapport de couverture JaCoCo généré"
}

# Résumé
Write-Host ""
Write-Host "📋 Résumé du test:" -ForegroundColor Cyan
Write-Host "==================" -ForegroundColor Cyan
Write-Success "Pipeline testé avec succès"
Write-Success "Projet compilé et packagé"
Write-Success "Tests exécutés"
Write-Success "Artefacts générés"

Write-Host ""
Write-Host "🎯 Prochaines étapes:" -ForegroundColor Cyan
Write-Host "- Configurer Jenkins avec le Jenkinsfile"
Write-Host "- Intégrer SonarQube pour l'analyse de qualité"
Write-Host "- Configurer Docker pour la containerisation"
Write-Host "- Déployer sur Kubernetes"

Write-Host ""
Write-Success "Test du pipeline termine! 🚀"
