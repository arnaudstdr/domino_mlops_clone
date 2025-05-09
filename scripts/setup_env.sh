#!/bin/bash

# Script d'initialisation de l'environnement de développement
echo "🚀 Initialisation de l'environnement MLOps..."

# Vérification de conda
if ! command -v conda &> /dev/null; then
    echo "❌ Conda n'est pas installé ou n'est pas dans le PATH."
    echo "Veuillez installer Miniconda ou Anaconda et réessayer."
    exit 1
fi

# Création de l'environnement conda
echo "📦 Création de l'environnement conda 'domino-mlops'..."
conda env create -f environment.yml || conda env update -f environment.yml

echo "✅ Environnement conda 'domino-mlops' créé/mis à jour avec succès."
echo "🔄 Pour activer l'environnement, exécutez: conda activate domino-mlops"

# Vérification de Docker
if ! command -v docker &> /dev/null; then
    echo "⚠️ Docker n'est pas installé ou n'est pas dans le PATH."
    echo "Certaines fonctionnalités du projet nécessitent Docker."
else
    echo "✅ Docker est installé."
fi

# Vérification de kubectl
if ! command -v kubectl &> /dev/null; then
    echo "⚠️ kubectl n'est pas installé ou n'est pas dans le PATH."
    echo "L'interaction avec Kubernetes nécessitera kubectl."
else
    echo "✅ kubectl est installé."
fi

# Vérification de Minikube
if ! command -v minikube &> /dev/null; then
    echo "⚠️ Minikube n'est pas installé ou n'est pas dans le PATH."
    echo "L'environnement Kubernetes local nécessitera Minikube."
else
    echo "✅ Minikube est installé."
fi

echo ""
echo "🎉 Setup terminé! Voici les prochaines étapes recommandées:"
echo "1. Activez l'environnement: conda activate domino-mlops"
echo "2. Démarrez Minikube: minikube start"
echo "3. Vérifiez l'état du cluster: kubectl get nodes"
echo ""
echo "Pour plus d'informations, consultez le README.md du projet."
