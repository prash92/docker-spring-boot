# Stage 1: Build the application
FROM maven:3.8.4-openjdk-11 AS build
WORKDIR /app
COPY pom.xml .
