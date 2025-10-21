# Script de déploiement UrbanInvest sur Kubernetes
Write-Host "🚀 Déploiement UrbanInvest sur Kubernetes" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

# Vérifier que kubectl est installé
if (-not (Get-Command kubectl -ErrorAction SilentlyContinue)) {
    Write-Host "❌ kubectl n'est pas installé" -ForegroundColor Red
    exit 1
}

# Vérifier la connexion au cluster
Write-Host "🔍 Vérification de la connexion au cluster..." -ForegroundColor Blue
kubectl cluster-info

# Créer le namespace
Write-Host "📦 Création du namespace urbaninvest..." -ForegroundColor Blue
kubectl create namespace urbaninvest --dry-run=client -o yaml | kubectl apply -f -

# Déployer les ressources dans l'ordre
Write-Host "🗄️  Déploiement du PVC MySQL..." -ForegroundColor Yellow
kubectl apply -f pvc.yaml -n urbaninvest

Write-Host "🗄️  Déploiement de MySQL..." -ForegroundColor Yellow
kubectl apply -f mysql-deployment.yaml -n urbaninvest
kubectl apply -f mysql-service.yaml -n urbaninvest

Write-Host "⏳ Attente que MySQL soit prêt..." -ForegroundColor Yellow
kubectl wait --for=condition=ready pod -l app=mysql -n urbaninvest --timeout=300s

Write-Host "🏢 Déploiement de l'application UrbanInvest..." -ForegroundColor Yellow
kubectl apply -f deployment.yaml -n urbaninvest
kubectl apply -f service.yaml -n urbaninvest

Write-Host "🌐 Configuration de l'Ingress..." -ForegroundColor Yellow
kubectl apply -f ingress.yaml -n urbaninvest

Write-Host "📊 Statut du déploiement..." -ForegroundColor Blue
kubectl get all -n urbaninvest

Write-Host "✅ Déploiement terminé !" -ForegroundColor Green
Write-Host ""
Write-Host "🌐 URLs d'accès :" -ForegroundColor Cyan
Write-Host "- Application: http://urbaninvest.local" -ForegroundColor White
Write-Host "- MySQL: mysql-service.urbaninvest.svc.cluster.local:3306" -ForegroundColor White
Write-Host ""
Write-Host "📋 Commandes utiles :" -ForegroundColor Cyan
Write-Host "- Voir les pods: kubectl get pods -n urbaninvest" -ForegroundColor White
Write-Host "- Voir les logs: kubectl logs -f deployment/urbaninvest-app -n urbaninvest" -ForegroundColor White
Write-Host "- Supprimer: kubectl delete namespace urbaninvest" -ForegroundColor White
