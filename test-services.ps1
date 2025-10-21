# Script pour tester l'accès aux services UrbanInvest
Write-Host "🔍 Test des services UrbanInvest" -ForegroundColor Cyan
Write-Host "=================================" -ForegroundColor Cyan

# Fonction pour tester un service
function Test-Service {
    param($Name, $URL, $Port)
    
    try {
        $response = Invoke-WebRequest -Uri $URL -TimeoutSec 10 -ErrorAction Stop
        Write-Host "✅ $Name est accessible sur le port $Port" -ForegroundColor Green
        return $true
    } catch {
        Write-Host "❌ $Name n'est pas accessible sur le port $Port" -ForegroundColor Red
        Write-Host "   Erreur: $($_.Exception.Message)" -ForegroundColor Yellow
        return $false
    }
}

Write-Host ""
Write-Host "🧪 Test des services..." -ForegroundColor Blue

# Test MySQL
Write-Host "1️⃣  Test MySQL..." -ForegroundColor Yellow
try {
    $mysqlTest = Test-NetConnection -ComputerName localhost -Port 3306 -InformationLevel Quiet
    if ($mysqlTest) {
        Write-Host "✅ MySQL est accessible sur le port 3306" -ForegroundColor Green
    } else {
        Write-Host "❌ MySQL n'est pas accessible sur le port 3306" -ForegroundColor Red
    }
} catch {
    Write-Host "❌ Erreur lors du test MySQL" -ForegroundColor Red
}

# Test SonarQube
Write-Host "2️⃣  Test SonarQube..." -ForegroundColor Yellow
$sonarAccessible = Test-Service "SonarQube" "http://localhost:9000" "9000"

# Test Jenkins
Write-Host "3️⃣  Test Jenkins..." -ForegroundColor Yellow
$jenkinsAccessible = Test-Service "Jenkins" "http://localhost:8081" "8081"

Write-Host ""
Write-Host "📊 Résumé des tests:" -ForegroundColor Cyan
Write-Host "===================" -ForegroundColor Cyan

if ($sonarAccessible) {
    Write-Host "✅ SonarQube: http://localhost:9000 (admin/admin)" -ForegroundColor Green
} else {
    Write-Host "❌ SonarQube: Non accessible" -ForegroundColor Red
}

if ($jenkinsAccessible) {
    Write-Host "✅ Jenkins: http://localhost:8081" -ForegroundColor Green
    Write-Host "   Mot de passe initial:" -ForegroundColor Yellow
    Write-Host "   docker exec urbaninvest-jenkins cat /var/jenkins_home/secrets/initialAdminPassword" -ForegroundColor White
} else {
    Write-Host "❌ Jenkins: Non accessible" -ForegroundColor Red
}

Write-Host "✅ MySQL: localhost:3306 (urbaninvest/urbaninvest123)" -ForegroundColor Green

Write-Host ""
Write-Host "🎯 Prochaines étapes:" -ForegroundColor Cyan
Write-Host "- Accéder à SonarQube et créer un projet"
Write-Host "- Configurer Jenkins avec le pipeline"
Write-Host "- Analyser la qualité du code avec SonarQube"
Write-Host "- Corriger les issues détectées"

Write-Host ""
Write-Host "📋 Commandes utiles:" -ForegroundColor Cyan
Write-Host "docker-compose logs -f [service]  # Voir les logs"
Write-Host "docker-compose restart [service]  # Redémarrer un service"
Write-Host "docker-compose down              # Arrêter tous les services"

