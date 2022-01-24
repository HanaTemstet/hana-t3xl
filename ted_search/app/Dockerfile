FROM openjdk:8-jre-slim
COPY target/embedash-1.1-SNAPSHOT.jar ./app/
COPY application.properties ./app/
WORKDIR /app
ENTRYPOINT ["sh","-c","java -jar ./embedash-1.1-SNAPSHOT.jar --spring.config.location=./application.properties"] 