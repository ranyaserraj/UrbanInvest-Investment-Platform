# Dockerfile pour UrbanInvest Platform
FROM maven:3.8.6-openjdk-8-slim AS build

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de configuration Maven
COPY pom.xml .

# Télécharger les dépendances (cache layer)
RUN mvn dependency:go-offline -B

# Copier le code source
COPY src ./src

# Build l'application
RUN mvn clean package -DskipTests

# Stage de production avec Tomcat
FROM tomcat:9.0-jdk8-openjdk-slim

# Supprimer les applications par défaut de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copier le fichier WAR depuis le stage de build
COPY --from=build /app/target/urbaninvest.war /usr/local/tomcat/webapps/ROOT.war

# Créer un utilisateur non-root pour la sécurité
RUN groupadd -r tomcat && useradd -r -g tomcat tomcat
RUN chown -R tomcat:tomcat /usr/local/tomcat
USER tomcat

# Exposer le port 8080
EXPOSE 8080

# Variables d'environnement
ENV CATALINA_OPTS="-Xmx512m -Xms256m"

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:8080/ || exit 1

# Commande de démarrage
CMD ["catalina.sh", "run"]
