# Utiliser l'image officielle de Python comme image de base
FROM python:3.9-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /usr/src/app

# Copier les fichiers de requirements et le code source dans le conteneur
COPY requirements.txt .

# Installer les dépendances nécessaires
RUN pip install -r requirements.txt

# Copier le reste du code source dans le conteneur
COPY . .

# Exposer le port sur lequel l'application va tourner
EXPOSE 8000

# Exécuter les migrations de la base de données
RUN python manage.py migrate

# Commande pour démarrer le serveur Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]