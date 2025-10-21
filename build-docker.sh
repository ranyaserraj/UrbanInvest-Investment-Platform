#!/bin/bash

# Script pour construire l'image Docker depuis l'hôte
# Ce script est exécuté depuis l'hôte, pas depuis Jenkins

set -e

echo "🐳 Construction de l'image Docker UrbanInvest..."

# Variables
DOCKER_IMAGE="urbaninvest/urbaninvest-platform"
DOCKER_TAG="${1:-latest}"

# Construction de l'image
echo "Construction de l'image ${DOCKER_IMAGE}:${DOCKER_TAG}..."
docker build -f Dockerfile.webapp -t ${DOCKER_IMAGE}:${DOCKER_TAG} .

# Tag de l'image
echo "Tag de l'image ${DOCKER_IMAGE}:latest..."
docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_IMAGE}:latest

# Vérification
echo "Vérification de l'image créée..."
docker images | grep ${DOCKER_IMAGE}

echo "✅ Image Docker construite avec succès !"
echo "   Image: ${DOCKER_IMAGE}:${DOCKER_TAG}"
echo "   Tag: ${DOCKER_IMAGE}:latest"
