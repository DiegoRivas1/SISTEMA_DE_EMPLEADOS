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

##Corriendo el servicio desde render si subir target a github
# ---------- BUILD ----------
FROM maven:3.9-eclipse-temurin-25 AS build
WORKDIR /app
COPY pom.xml .
# Descarga dependencias primero (cache de Docker)
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn clean package -DskipTests

# ---------- RUNTIME ----------
FROM eclipse-temurin:25-jdk-jammy
WORKDIR /app
COPY --from=build /app/target/empleados-0.0.1-SNAPSHOT.war app.war

ENTRYPOINT ["sh", "-c", "java -XX:TieredStopAtLevel=1 -Xms128m -Xmx400m -jar app.war --server.port=${PORT:-8080}"]

##Subiendo target a github
#FROM eclipse-temurin:25-jdk-jammy
#WORKDIR /app

# Solo copia el WAR pre-compilado del repo
#COPY target/empleados-0.0.1-SNAPSHOT.war app.war

#ENTRYPOINT ["sh", "-c", "java -XX:TieredStopAtLevel=1 -Xms128m -Xmx400m -jar app.war --server.port=${PORT:-8080}"]
