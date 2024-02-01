# Use the official Amazon Corretto base image
FROM maven:3.8.3-openjdk-17

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project files to the container
COPY pom.xml .
COPY src ./src

# Build the application using Maven
RUN mvn clean install

# Expose the port that your application will run on (adjust as needed)
EXPOSE 8080

# Garbage collection options
ENV JAVA_OPTS="-Xms256m -Xmx512m -XX:MaxMetaspaceSize=256m -XX:+UseG1GC -XX:+UseStringDeduplication"

# Command to run the application with garbage collection options
CMD ["java", "$JAVA_OPTS", "-jar", "target/ms-nillacomm-configuration-server.jar"]
