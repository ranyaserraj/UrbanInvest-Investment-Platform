# 📁 Dossier SQL - UrbanInvest

## 📖 Description

Ce dossier contient tous les fichiers SQL nécessaires pour configurer et initialiser la base de données du projet UrbanInvest.

## 📄 Fichiers

### `UrbanInvest.sql`
Fichier principal contenant :
- ✅ Structure complète de la base de données `projet3`
- ✅ Toutes les tables avec leurs relations
- ✅ Données d'exemple pour les tests
- ✅ Contraintes d'intégrité (clés étrangères)
- ✅ Configuration du charset UTF-8

## 🚀 Installation de la Base de Données

### Méthode 1 : Via phpMyAdmin
1. Ouvrir phpMyAdmin dans votre navigateur
2. Créer une nouvelle base de données nommée `projet3`
3. Sélectionner la base `projet3`
4. Aller dans l'onglet "Importer"
5. Choisir le fichier `UrbanInvest.sql`
6. Cliquer sur "Exécuter"

### Méthode 2 : Via ligne de commande MySQL
```bash
# Se connecter à MySQL
mysql -u root -p

# Créer la base de données
CREATE DATABASE projet3;
exit;

# Importer le fichier SQL
mysql -u root -p projet3 < sql/UrbanInvest.sql
```

### Méthode 3 : Via XAMPP
1. Démarrer Apache et MySQL depuis le panneau XAMPP
2. Ouvrir phpMyAdmin (http://localhost/phpmyadmin)
3. Suivre les étapes de la Méthode 1

## 🗃️ Structure de la Base de Données

### Tables Principales

| Table | Description | Rôle |
|-------|-------------|------|
| `users` | Utilisateurs du système | Gestion des comptes (investisseurs/experts) |
| `demande_conseil` | Demandes de conseil | Soumission de projets d'investissement |
| `etude_marche` | Études de marché | Analyses de marché détaillées |
| `etude_financier` | Études financières | Analyses financières des projets |
| `traitement_conseil` | Traitement des conseils | Rapports générés par les experts |
| `traitement_etude_marche` | Traitement études marché | Rapports d'études de marché |
| `paiement` | Gestion des paiements | Validation des preuves de paiement |

### Relations Clés
- `users` ← `demande_conseil` (Un utilisateur peut avoir plusieurs demandes)
- `users` ← `etude_marche` (Un utilisateur peut demander plusieurs études)
- `demande_conseil` ← `traitement_conseil` (Une demande = un traitement)
- `etude_marche` ← `paiement` (Une étude = un paiement)
- `etude_marche` ← `traitement_etude_marche` (Une étude = un traitement)

## 🔧 Configuration Requise

### Prérequis
- **MySQL** 5.7+ ou **MariaDB** 10.2+
- **Charset** : UTF-8 (utf8mb4)
- **Moteur** : InnoDB (pour les contraintes d'intégrité)

### Paramètres de Connexion
```properties
# Configuration par défaut pour développement local
DB_HOST=127.0.0.1
DB_PORT=3306
DB_NAME=projet3
DB_USER=root
DB_PASSWORD=(votre mot de passe MySQL)
```

## 📊 Données de Test

Le fichier contient des données d'exemple pour :
- ✅ Comptes utilisateurs de test
- ✅ Exemples de demandes d'études
- ✅ Données de traitement fictives
- ✅ Historique de paiements

### Comptes de Test Disponibles
| Email | Mot de passe | Rôle |
|-------|--------------|------|
| ranya@gmail.com | 2004 | Utilisateur |
| expert1@gmail.com | expert1 | Expert |
| expert2@gmail.com | expert2 | Expert |

## 🛡️ Sécurité

- Les mots de passe sont stockés en clair (⚠️ À changer en production)
- Recommandation : Implémenter le hachage des mots de passe
- Contraintes d'intégrité référentielle activées

## 📋 Maintenance

### Sauvegarde Recommandée
```bash
# Créer une sauvegarde
mysqldump -u root -p projet3 > backup_$(date +%Y%m%d).sql
```

### Réinitialisation
```bash
# Supprimer et recréer la base
mysql -u root -p -e "DROP DATABASE IF EXISTS projet3; CREATE DATABASE projet3;"
mysql -u root -p projet3 < sql/UrbanInvest.sql
```

## 🐛 Dépannage

### Erreurs Communes

**Erreur d'encodage :**
```sql
-- Vérifier l'encodage
SHOW VARIABLES LIKE 'character_set%';
-- Doit afficher utf8mb4
```

**Erreur de connexion :**
- Vérifier que MySQL/MariaDB est démarré
- Vérifier les identifiants de connexion
- Vérifier les ports (3306 par défaut)

**Contraintes d'intégrité :**
- S'assurer que les clés étrangères respectent l'ordre d'insertion
- Les données d'exemple respectent déjà cet ordre

## 📞 Support

En cas de problème lors de l'installation :
1. Vérifier les logs MySQL/MariaDB
2. S'assurer que XAMPP est correctement configuré
3. Vérifier les permissions de fichiers
