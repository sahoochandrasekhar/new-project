# Use the Maven image to build the project
FROM maven:3.8.5-openjdk-11 AS build
WORKDIR /app
COPY . /app
RUN mvn clean package

# Use a lightweight JDK image for running the application
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/simple-java-project-1.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]

