#FROM openjdk:25-jdk-slim
FROM eclipse-temurin:25-jdk-jammy
ARG JAR_FILE=target/empleados-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app_sistema_empleado.jar
EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "app_sistema_empleado.jar" ]