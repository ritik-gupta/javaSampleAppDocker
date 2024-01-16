# Use the official maven/Java 17 image to create a build artifact.
FROM maven:3.8.4-openjdk-17 as builder

# Set the working directory in the image
WORKDIR /app

# Copy the pom.xml file
COPY pom.xml .

# Copy the src directory (Your Java source code)
COPY src ./src

# Build a release artifact.
RUN mvn clean install

# Use AdoptOpenJDK for base image.
FROM eclipse-temurin:17-jdk

# Copy the jar to the production image from the builder stage.
COPY --from=builder /app/target/java-app-runner.jar /java-app.jar

# Run the web service on container startup.
CMD ["java", "-jar", "/java-app.jar"]