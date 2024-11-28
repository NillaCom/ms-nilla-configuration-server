# Use Amazon Corretto as the base image
FROM amazoncorretto:17-alpine3.19

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file to the container
COPY ./target/ms-nilla-menu-service-0.0.1.jar /app

# Expose the port the application will run on
EXPOSE 8888

# Command to run the application
CMD ["java", "-XX:+UseG1GC", "-XX:MaxGCPauseMillis=100", "-XX:InitiatingHeapOccupancyPercent=70", "-XX:+ExplicitGCInvokesConcurrent", "-jar", "ms-nilla-configuration-server-1.0.0.jar"]