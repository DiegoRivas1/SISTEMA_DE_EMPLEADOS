#FROM openjdk:25-jdk-slim

#FROM eclipse-temurin:25-jdk-jammy
#ARG JAR_FILE=target/empleados-0.0.1-SNAPSHOT.jar
#COPY ${JAR_FILE} app_sistema_empleado.jar
#EXPOSE 8080
#ENTRYPOINT [ "java", "-jar", "app_sistema_empleado.jar" ]

#FROM openjdk:25-jdk-slim

#FROM eclipse-temurin:25-jdk-jammy
#ARG JAR_FILE=target/empleados-0.0.1-SNAPSHOT.jar
#COPY ${JAR_FILE} app_sistema_empleado.jar
#EXPOSE 8080
#ENTRYPOINT [ "java", "-jar", "app_sistema_empleado.jar" ]

# ---------- BUILD ----------
FROM maven:3.9-eclipse-temurin-25 AS build
WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# ---------- RUNTIME ----------
FROM eclipse-temurin:25-jdk-jammy
WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

# No es necesario EXPOSE para Render
#EXPOSE 8080

# ENTRYPOINT directo, usando la variable PORT de Render
ENTRYPOINT ["sh", "-c", "java -jar app.jar --server.port=$PORT"]