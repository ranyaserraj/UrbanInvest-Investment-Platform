#!/bin/bash

# Script pour déployer avec Docker Compose depuis l'hôte
# Ce script est exécuté depuis l'hôte, pas depuis Jenkins

set -e

echo "🐳 Déploiement avec Docker Compose..."

# Arrêter les conteneurs existants
echo "Arrêt des conteneurs existants..."
docker-compose -f docker-compose.k8s.yml down || true

# Démarrer les nouveaux conteneurs
echo "Démarrage des nouveaux conteneurs..."
docker-compose -f docker-compose.k8s.yml up -d

# Attendre que les services soient prêts
echo "Attente du démarrage des services..."
sleep 30

# Vérifier l'état des conteneurs
echo "Vérification de l'état des conteneurs..."
docker-compose -f docker-compose.k8s.yml ps

echo "✅ Déploiement Docker Compose terminé !"
echo "   Application: http://localhost:8082"
echo "   Proxy Nginx: http://localhost:3000"
