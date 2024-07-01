# Použití základního Newman image
FROM postman/newman:alpine

# Instalace Node.js a NPM
RUN apk add --no-cache nodejs npm

# Pracovní adresář pro aplikaci
WORKDIR /app

# Kopírování serverového skriptu a package.json do kontejneru
COPY server.js package.json /app/

# Instalace závislostí
RUN npm install

# Kopírování kolekcí Newman testů do kontejneru
COPY ./collections /etc/newman

# Exponování portu 8080
EXPOSE 8080

# CMD pro spuštění serveru a poté Newman testů
ENTRYPOINT ["sh", "-c", "node /app/server.js & sleep 5 && newman run /etc/newman/collection.json"]
