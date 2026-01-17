# Base image
FROM eclipse-temurin:17-jdk-jammy

# Working directory
WORKDIR /app

# Copy jar from target
COPY app.jar app.jar

# Expose the port
EXPOSE 8081

# Run the jar on port 8081
CMD ["java", "-jar", "app.jar", "--server.port=8081"]
