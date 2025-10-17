# UrbanInvest - DevOps Pipeline

## 📋 Description du Projet

**UrbanInvest** est une plateforme web JEE dédiée aux investissements urbains et immobiliers. Elle facilite la mise en relation entre investisseurs et experts pour l'évaluation de projets d'investissement.

### Technologies Utilisées
- **Backend**: Java 2EE, Apache Tomcat
- **Frontend**: JSP, HTML/CSS/JavaScript
- **Base de données**: MySQL
- **Serveur**: XAMPP

### Fonctionnalités Principales
- Études de marché
- Études financières
- Études de faisabilité
- Gestion des paiements
- Notifications par email

## 🌿 Convention de Branches (Git Flow)

Nous utilisons la convention **Git Flow** avec les branches suivantes :

- **`main`** : Branche de production (code stable)
- **`develop`** : Branche de développement (intégration des features)
- **`feature/*`** : Branches de fonctionnalités (ex: `feature/jenkins-pipeline`)
- **`release/*`** : Branches de release (ex: `release/v1.0.0`)
- **`hotfix/*`** : Branches de correction urgente (ex: `hotfix/security-fix`)

### Politique de Merge
1. Les features sont développées dans des branches `feature/*`
2. Merge vers `develop` après validation
3. Les releases sont préparées dans `release/*`
4. Merge vers `main` uniquement pour les releases validées
5. Les hotfixes sont mergées directement vers `main` et `develop`

## 📊 Historique des Commits

```
* ff23459 (develop) Initial commit: Add UrbanInvest project with .gitignore
* [commits originaux du projet]
```

## 🚀 Pipeline DevOps

### Étapes Implémentées
1. ✅ **GitHub** - Gestion du code source
2. 🔄 **Jenkins** - Intégration continue
3. 🔄 **SonarQube** - Qualité du code
4. 🔄 **Docker** - Containerisation
5. 🔄 **Kubernetes** - Déploiement
6. 🔄 **Prometheus & Grafana** - Supervision

---

*Documentation mise à jour le: $(date)*
