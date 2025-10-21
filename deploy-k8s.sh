#!/bin/bash

# Script de déploiement Kubernetes pour UrbanInvest Platform
# Ce script déploie l'application avec monitoring sur Kubernetes

set -e

echo "🚀 Déploiement UrbanInvest Platform sur Kubernetes..."

# Variables
NAMESPACE="urbaninvest"
APP_NAME="urbaninvest-app"

# Fonction pour vérifier si kubectl est disponible
check_kubectl() {
    if ! command -v kubectl &> /dev/null; then
        echo "❌ kubectl n'est pas installé ou n'est pas dans le PATH"
        exit 1
    fi
    echo "✅ kubectl est disponible"
}

# Fonction pour créer le namespace
create_namespace() {
    echo "📁 Création du namespace ${NAMESPACE}..."
    kubectl create namespace ${NAMESPACE} --dry-run=client -o yaml | kubectl apply -f -
}

# Fonction pour déployer les PVC
deploy_pvc() {
    echo "💾 Déploiement des Persistent Volume Claims..."
    kubectl apply -f k8s/pvc.yaml -n ${NAMESPACE}
}

# Fonction pour déployer l'application
deploy_app() {
    echo "🏗️ Déploiement de l'application..."
    kubectl apply -f k8s/ -n ${NAMESPACE}
    
    echo "⏳ Attente du déploiement de l'application..."
    kubectl rollout status deployment/${APP_NAME} -n ${NAMESPACE} --timeout=300s
}

# Fonction pour déployer le monitoring
deploy_monitoring() {
    echo "📊 Déploiement du monitoring..."
    kubectl apply -f monitoring/prometheus/ -n ${NAMESPACE}
    kubectl apply -f monitoring/grafana/ -n ${NAMESPACE}
    
    echo "⏳ Attente du démarrage des services de monitoring..."
    kubectl wait --for=condition=available --timeout=300s deployment/prometheus -n ${NAMESPACE} || true
    kubectl wait --for=condition=available --timeout=300s deployment/grafana -n ${NAMESPACE} || true
}

# Fonction pour afficher les informations de déploiement
show_info() {
    echo ""
    echo "🎉 Déploiement terminé !"
    echo ""
    echo "📋 Informations du déploiement :"
    echo "   Namespace: ${NAMESPACE}"
    echo "   Application: ${APP_NAME}"
    echo ""
    
    echo "🔍 État des pods :"
    kubectl get pods -n ${NAMESPACE}
    echo ""
    
    echo "🌐 Services disponibles :"
    kubectl get services -n ${NAMESPACE}
    echo ""
    
    echo "🔗 URLs d'accès (avec port-forward) :"
    echo "   Application: kubectl port-forward service/urbaninvest-service 8080:8080 -n ${NAMESPACE}"
    echo "   Grafana: kubectl port-forward service/grafana-service 3000:3000 -n ${NAMESPACE}"
    echo "   Prometheus: kubectl port-forward service/prometheus-service 9090:9090 -n ${NAMESPACE}"
    echo ""
    
    echo "📊 Commandes utiles :"
    echo "   Voir les logs: kubectl logs -f deployment/${APP_NAME} -n ${NAMESPACE}"
    echo "   Redémarrer l'app: kubectl rollout restart deployment/${APP_NAME} -n ${NAMESPACE}"
    echo "   Supprimer tout: kubectl delete namespace ${NAMESPACE}"
}

# Fonction principale
main() {
    echo "🔧 Vérification des prérequis..."
    check_kubectl
    
    echo "🏗️ Déploiement en cours..."
    create_namespace
    deploy_pvc
    deploy_app
    deploy_monitoring
    
    show_info
}

# Exécution du script
main "$@"
