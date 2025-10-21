#!/bin/bash

# Script de déploiement UrbanInvest sur Kubernetes
echo "🚀 Déploiement UrbanInvest sur Kubernetes"
echo "=========================================="

# Vérifier que kubectl est installé
if ! command -v kubectl &> /dev/null; then
    echo "❌ kubectl n'est pas installé"
    exit 1
fi

# Vérifier la connexion au cluster
echo "🔍 Vérification de la connexion au cluster..."
kubectl cluster-info

# Créer le namespace
echo "📦 Création du namespace urbaninvest..."
kubectl create namespace urbaninvest --dry-run=client -o yaml | kubectl apply -f -

# Déployer les ressources dans l'ordre
echo "🗄️  Déploiement du PVC MySQL..."
kubectl apply -f pvc.yaml -n urbaninvest

echo "🗄️  Déploiement de MySQL..."
kubectl apply -f mysql-deployment.yaml -n urbaninvest
kubectl apply -f mysql-service.yaml -n urbaninvest

echo "⏳ Attente que MySQL soit prêt..."
kubectl wait --for=condition=ready pod -l app=mysql -n urbaninvest --timeout=300s

echo "🏢 Déploiement de l'application UrbanInvest..."
kubectl apply -f deployment.yaml -n urbaninvest
kubectl apply -f service.yaml -n urbaninvest

echo "🌐 Configuration de l'Ingress..."
kubectl apply -f ingress.yaml -n urbaninvest

echo "📊 Statut du déploiement..."
kubectl get all -n urbaninvest

echo "✅ Déploiement terminé !"
echo ""
echo "🌐 URLs d'accès :"
echo "- Application: http://urbaninvest.local"
echo "- MySQL: mysql-service.urbaninvest.svc.cluster.local:3306"
echo ""
echo "📋 Commandes utiles :"
echo "- Voir les pods: kubectl get pods -n urbaninvest"
echo "- Voir les logs: kubectl logs -f deployment/urbaninvest-app -n urbaninvest"
echo "- Supprimer: kubectl delete namespace urbaninvest"
