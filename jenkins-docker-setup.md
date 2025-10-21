# Configuration Jenkins avec Docker pour UrbanInvest

## 🐳 Environnement Docker

Puisque vous avez déjà Jenkins en Docker, voici comment configurer le pipeline pour UrbanInvest.

## 📋 Prérequis

### 1. Services Docker en cours d'exécution
```bash
# Démarrer l'environnement complet
docker-compose up -d

# Vérifier les services
docker-compose ps
```

### 2. Accès aux services
- **Jenkins**: http://localhost:8081
- **SonarQube**: http://localhost:9000
- **UrbanInvest App**: http://localhost:8080
- **MySQL**: localhost:3306

## 🔧 Configuration Jenkins

### 1. Accès initial à Jenkins
1. Ouvrir http://localhost:8081
2. Récupérer le mot de passe initial :
```bash
docker exec urbaninvest-jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

### 2. Installation des plugins requis
Dans Jenkins → Manage Jenkins → Manage Plugins :

**Plugins à installer :**
- ✅ Pipeline (déjà inclus)
- ✅ Git (déjà inclus)
- ✅ Docker Pipeline
- ✅ SonarQube Scanner
- ✅ HTML Publisher
- ✅ Email Extension
- ✅ Kubernetes
- ✅ Maven Integration

### 3. Configuration des outils globaux
Dans Jenkins → Manage Jenkins → Global Tool Configuration :

#### JDK
- **Name**: JDK-8
- **JAVA_HOME**: /usr/lib/jvm/java-8-openjdk-amd64

#### Maven
- **Name**: Maven-3.8.6
- **MAVEN_HOME**: /usr/share/maven

#### Docker
- **Name**: Docker
- **Docker installation**: Install automatically

### 4. Configuration SonarQube
Dans Jenkins → Manage Jenkins → Configure System :

#### SonarQube servers
- **Name**: SonarQube
- **Server URL**: http://sonarqube:9000
- **Server authentication token**: [Créer un token dans SonarQube]

### 5. Configuration des credentials
Dans Jenkins → Manage Jenkins → Manage Credentials :

#### SonarQube Token
- **Kind**: Secret text
- **ID**: sonar-token
- **Secret**: [Token SonarQube]

#### Docker Hub (optionnel)
- **Kind**: Username with password
- **ID**: docker-hub-credentials
- **Username**: [Docker Hub username]
- **Password**: [Docker Hub password]

## 🚀 Création du Pipeline

### 1. Nouveau Job Pipeline
1. **New Item** → **Pipeline**
2. **Name**: urbaninvest-pipeline
3. **Description**: Pipeline CI/CD pour UrbanInvest Platform

### 2. Configuration du Pipeline
- **Definition**: Pipeline script from SCM
- **SCM**: Git
- **Repository URL**: [URL de votre repository]
- **Branch**: */develop
- **Script Path**: Jenkinsfile

### 3. Déclencheurs
- ✅ **GitHub hook trigger for GITScm polling**
- ✅ **Poll SCM**: H/5 * * * * (toutes les 5 minutes)

## 🔍 Configuration SonarQube

### 1. Accès à SonarQube
1. Ouvrir http://localhost:9000
2. **Login**: admin
3. **Password**: admin

### 2. Créer un token
1. **Administration** → **Security** → **Users**
2. **Tokens** → **Generate Tokens**
3. **Name**: jenkins-token
4. **Type**: User Token
5. **Expires**: No expiration
6. Copier le token généré

### 3. Configuration du projet
1. **Create Project** → **Manually**
2. **Project Key**: urbaninvest-platform
3. **Display Name**: UrbanInvest Platform

## 🧪 Test du Pipeline

### 1. Build manuel
1. Aller sur le job Jenkins
2. **Build Now**
3. Vérifier les logs de build

### 2. Vérification des étapes
- ✅ **Checkout**: Clone du repository
- ✅ **Build**: Compilation Maven
- ✅ **Test**: Exécution des tests
- ✅ **Package**: Création du WAR
- ✅ **SonarQube Analysis**: Analyse de qualité
- ✅ **Docker Build**: Construction de l'image

## 📊 Monitoring

### 1. Logs Jenkins
```bash
# Voir les logs Jenkins
docker-compose logs -f jenkins

# Voir les logs d'un build spécifique
docker exec urbaninvest-jenkins cat /var/jenkins_home/jobs/urbaninvest-pipeline/builds/[BUILD_NUMBER]/log
```

### 2. Logs SonarQube
```bash
# Voir les logs SonarQube
docker-compose logs -f sonarqube
```

### 3. Métriques
- **Build History**: Historique des builds
- **Test Results**: Résultats des tests
- **SonarQube Quality Gate**: Statut de qualité
- **Docker Images**: Images construites

## 🛠️ Dépannage

### Problèmes courants

#### 1. Jenkins ne peut pas accéder à SonarQube
```bash
# Vérifier la connectivité réseau
docker exec urbaninvest-jenkins ping sonarqube
```

#### 2. Maven ne trouve pas les dépendances
```bash
# Vérifier la configuration Maven
docker exec urbaninvest-jenkins mvn -version
```

#### 3. Docker build échoue
```bash
# Vérifier Docker dans Jenkins
docker exec urbaninvest-jenkins docker --version
```

### Commandes utiles
```bash
# Redémarrer un service
docker-compose restart jenkins

# Voir les logs en temps réel
docker-compose logs -f jenkins

# Accéder au shell Jenkins
docker exec -it urbaninvest-jenkins bash

# Nettoyer les volumes
docker-compose down -v
```

## 📧 Notifications

### Configuration SMTP (optionnel)
Dans Jenkins → Manage Jenkins → Configure System :
- **SMTP server**: smtp.gmail.com
- **Port**: 587
- **Use SMTP Authentication**: ✅
- **Username**: jenkins@urbaninvest.com
- **Password**: [App Password]

---

*Configuration mise à jour pour l'environnement Docker*

