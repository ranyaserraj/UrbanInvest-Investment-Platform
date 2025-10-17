# Script pour démarrer l'environnement de développement UrbanInvest
# Usage: .\start-dev-environment.ps1

Write-Host "🚀 Démarrage de l'environnement de développement UrbanInvest" -ForegroundColor Cyan
Write-Host "=============================================================" -ForegroundColor Cyan

# Fonction pour afficher les messages
function Write-Success {
    param($Message)
    Write-Host "✅ $Message" -ForegroundColor Green
}

function Write-Info {
    param($Message)
    Write-Host "ℹ️  $Message" -ForegroundColor Blue
}

function Write-Warning {
    param($Message)
    Write-Host "⚠️  $Message" -ForegroundColor Yellow
}

# Vérifier si Docker est en cours d'exécution
Write-Host "🔍 Vérification de Docker..." -ForegroundColor Blue
try {
    docker --version | Out-Null
    Write-Success "Docker est disponible"
} catch {
    Write-Error "Docker n'est pas installé ou n'est pas en cours d'exécution"
    exit 1
}

# Vérifier si Docker Compose est disponible
try {
    docker-compose --version | Out-Null
    Write-Success "Docker Compose est disponible"
} catch {
    Write-Error "Docker Compose n'est pas disponible"
    exit 1
}

Write-Host ""
Write-Host "🐳 Démarrage des services..." -ForegroundColor Blue

# Démarrer les services
Write-Info "Démarrage de MySQL..."
docker-compose up -d mysql

Write-Info "Attente que MySQL soit prêt..."
Start-Sleep -Seconds 10

Write-Info "Démarrage de SonarQube..."
docker-compose up -d sonarqube

Write-Info "Démarrage de Jenkins..."
docker-compose up -d jenkins

Write-Info "Build et démarrage de l'application UrbanInvest..."
docker-compose up -d urbaninvest-app

Write-Host ""
Write-Host "⏳ Attente que tous les services soient prêts..." -ForegroundColor Yellow
Start-Sleep -Seconds 30

# Vérifier le statut des services
Write-Host ""
Write-Host "📊 Statut des services:" -ForegroundColor Cyan
Write-Host "======================" -ForegroundColor Cyan

$services = @(
    @{Name="MySQL"; Port="3306"; URL="localhost:3306"},
    @{Name="UrbanInvest App"; Port="8080"; URL="http://localhost:8080"},
    @{Name="Jenkins"; Port="8081"; URL="http://localhost:8081"},
    @{Name="SonarQube"; Port="9000"; URL="http://localhost:9000"}
)

foreach ($service in $services) {
    try {
        $response = Invoke-WebRequest -Uri $service.URL -TimeoutSec 5 -ErrorAction Stop
        Write-Success "$($service.Name) est accessible sur le port $($service.Port)"
    } catch {
        Write-Warning "$($service.Name) n'est pas encore accessible sur le port $($service.Port)"
    }
}

Write-Host ""
Write-Host "🎯 URLs d'accès:" -ForegroundColor Cyan
Write-Host "===============" -ForegroundColor Cyan
Write-Host "• Application UrbanInvest: http://localhost:8080" -ForegroundColor White
Write-Host "• Jenkins: http://localhost:8081" -ForegroundColor White
Write-Host "• SonarQube: http://localhost:9000" -ForegroundColor White
Write-Host "• MySQL: localhost:3306" -ForegroundColor White

Write-Host ""
Write-Host "🔑 Informations de connexion:" -ForegroundColor Cyan
Write-Host "=============================" -ForegroundColor Cyan
Write-Host "• MySQL - User: urbaninvest, Password: urbaninvest123" -ForegroundColor White
Write-Host "• SonarQube - User: admin, Password: admin" -ForegroundColor White
Write-Host "• Jenkins - Voir les logs pour le mot de passe initial" -ForegroundColor White

Write-Host ""
Write-Host "📋 Commandes utiles:" -ForegroundColor Cyan
Write-Host "===================" -ForegroundColor Cyan
Write-Host "• Voir les logs: docker-compose logs -f [service]" -ForegroundColor White
Write-Host "• Arrêter: docker-compose down" -ForegroundColor White
Write-Host "• Redémarrer: docker-compose restart [service]" -ForegroundColor White

Write-Host ""
Write-Success "Environnement de développement démarré! 🚀"
