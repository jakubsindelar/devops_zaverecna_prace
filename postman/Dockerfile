FROM postman/newman:alpine
COPY ./collections /etc/newman
ENTRYPOINT ["newman", "run", "/etc/newman/collection.json"]
