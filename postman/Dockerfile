FROM postman/newman:alpine
COPY ./collections /etc/newman
CMD ["newman", "run", "/etc/newman/collection.json"]
