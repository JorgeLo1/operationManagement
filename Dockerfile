# Dockerfile básico para Spring Boot
FROM openjdk:17-jdk-slim

# Información del mantenedor
LABEL maintainer="tu-email@ejemplo.com"

# Crear directorio de trabajo
WORKDIR /app

# Copiar el JAR generado (ajusta el nombre según tu proyecto)
COPY target/*.jar app.jar

# Exponer el puerto
EXPOSE 8080

# Variables de entorno opcionales
ENV JAVA_OPTS=""

# Comando para ejecutar la aplicación
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
