# Stage 1: Build the application
FROM maven:3.8.4-openjdk-11 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn clean package --no-transfer-progress

COPY src ./src
RUN mvn package --no-transfer-progress

# Stage 2: Create the final image
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/your-app.jar ./app.jar

EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
