FROM maven:3.8.3-jdk-8 AS build-stage
WORKDIR /app
COPY ./app/pom.xml ./pom.xml
COPY ./app/src/ ./src/
RUN mvn verify
FROM openjdk:8-jre-slim-buster
COPY --from=build-stage /app/target/*.jar /app/app.jar
ENTRYPOINT java -jar /app/app.jar --spring.config.location=./application.properties
