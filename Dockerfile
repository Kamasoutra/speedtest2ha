FROM debian:bullseye-slim

# Met à jour les paquets et installe Node.js, npm, et les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    curl \
    nodejs \
    npm \
    python3 \
    python3-pip \
    && pip3 install speedtest-cli \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Définit le répertoire de travail
WORKDIR /opt/speedtest2ha

# Copie le contenu de votre projet dans le conteneur
COPY . .

# Installe les dépendances de production pour Node.js
RUN npm ci --only=production

# Définit la commande par défaut
CMD [ "node", "src/speedtest.mjs" ]
