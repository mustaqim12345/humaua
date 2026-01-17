FROM openjdk:17-slim
WORKDIR /app
COPY app.jar app.jar
EXPOSE 8081
CMD ["java", "-jar", "app.jar"]
