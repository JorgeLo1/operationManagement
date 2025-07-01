# Cambiar estas líneas:
FROM openjdk:21-jdk-slim as build

# Y en runtime:
FROM openjdk:21-jre-slim

# Dockerfile completo:
FROM openjdk:21-jdk-slim as build

WORKDIR /app
COPY pom.xml .
COPY .mvn .mvn
COPY mvnw .
RUN chmod +x ./mvnw

RUN ./mvnw dependency:go-offline -B

COPY src ./src
RUN ./mvnw clean package -DskipTests

# Runtime stage
FROM openjdk:21-jre-slim

WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080
CMD ["java", "-Xms256m", "-Xmx512m", "-jar", "app.jar"]
