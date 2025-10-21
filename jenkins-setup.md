# Configuration Jenkins pour UrbanInvest

## 📋 Prérequis

### 1. Installation de Jenkins
```bash
# Sur Windows avec Chocolatey
choco install jenkins

# Ou télécharger depuis https://jenkins.io/download/
```

### 2. Plugins Requis
Installer les plugins suivants via Jenkins UI :
- **Pipeline** (déjà inclus)
- **Git** (déjà inclus)
- **Maven Integration** (déjà inclus)
- **SonarQube Scanner**
- **Docker Pipeline**
- **Kubernetes**
- **HTML Publisher**
- **Email Extension**

### 3. Configuration des Outils
Dans Jenkins → Manage Jenkins → Global Tool Configuration :

#### JDK
- **Name**: JDK-8
- **JAVA_HOME**: C:\Program Files\Java\jdk1.8.0_XXX

#### Maven
- **Name**: Maven-3.8.6
- **MAVEN_HOME**: C:\apache-maven-3.8.6

## 🔧 Configuration du Pipeline

### 1. Créer un Nouveau Job
1. **New Item** → **Pipeline**
2. **Name**: urbaninvest-pipeline
3. **Description**: Pipeline CI/CD pour UrbanInvest Platform

### 2. Configuration du Pipeline
- **Definition**: Pipeline script from SCM
- **SCM**: Git
- **Repository URL**: https://github.com/ranyaserraj/UrbanInvest-Investment-Platform.git
- **Branch**: */develop
- **Script Path**: Jenkinsfile

### 3. Déclencheurs
- ✅ **GitHub hook trigger for GITScm polling**
- ✅ **Poll SCM**: H/5 * * * * (toutes les 5 minutes)

## 🔐 Configuration des Credentials

### 1. SonarQube Token
- **Kind**: Secret text
- **ID**: sonar-token
- **Secret**: [Token généré depuis SonarQube]

### 2. Docker Hub
- **Kind**: Username with password
- **ID**: docker-hub-credentials
- **Username**: [Docker Hub username]
- **Password**: [Docker Hub password]

## 🚀 Étapes du Pipeline

### 1. Checkout
- Clone du repository
- Récupération du commit hash

### 2. Build
- Compilation avec Maven
- `mvn clean compile`

### 3. Test
- Exécution des tests unitaires
- `mvn test`
- Publication des rapports de tests

### 4. Package
- Création du fichier WAR
- `mvn package -DskipTests`
- Archivage des artefacts

### 5. SonarQube Analysis
- Analyse de la qualité du code
- `mvn sonar:sonar`
- Attente du Quality Gate

### 6. Docker Build
- Construction de l'image Docker
- Push vers Docker Hub

### 7. Deploy to Kubernetes
- Déploiement sur le cluster K8s
- Mise à jour de l'image
- Vérification du rollout

## 📧 Notifications Email

### Configuration SMTP
Dans Jenkins → Manage Jenkins → Configure System :
- **SMTP server**: smtp.gmail.com
- **Port**: 587
- **Use SMTP Authentication**: ✅
- **Username**: jenkins@urbaninvest.com
- **Password**: [App Password]

### Templates Email
- **Success**: Notification de build réussi
- **Failure**: Notification de build échoué
- **Unstable**: Notification de build instable

## 🔍 Monitoring du Pipeline

### Logs
- Console Output disponible pour chaque build
- Historique des builds avec statuts

### Métriques
- Durée des builds
- Taux de succès
- Couverture de code (SonarQube)

## 🛠️ Dépannage

### Problèmes Courants
1. **Maven not found**: Vérifier JAVA_HOME et MAVEN_HOME
2. **Git clone failed**: Vérifier les credentials Git
3. **SonarQube connection failed**: Vérifier le token et l'URL
4. **Docker build failed**: Vérifier Docker Hub credentials

### Logs Utiles
- Jenkins System Log
- Pipeline Console Output
- SonarQube Scanner Logs

---

*Configuration mise à jour le: $(date)*

