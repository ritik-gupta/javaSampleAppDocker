# Use Maven to build the application
FROM registry.access.redhat.com/ubi8/openjdk-11:1.18 as builder

WORKDIR /app

# Copy the pom.xml file
COPY pom.xml .

# Copy the src directory (Your Java source code)
COPY src ./src

# Copy the build script
COPY .mvn .mvn
COPY mvnw mvnw

# Build a release artifact.
RUN ./mvnw clean package -DskipTests


FROM registry.access.redhat.com/ubi8/openjdk-11:1.18

ENV LANGUAGE='en_US:en'

COPY --from=builder --chown=185 /app/target/quarkus-app/lib/ /deployments/lib/
COPY --from=builder --chown=185 /app/target/quarkus-app/*.jar /deployments/
COPY --from=builder --chown=185 /app/target/quarkus-app/app/ /deployments/app/
COPY --from=builder --chown=185 /app/target/quarkus-app/quarkus/ /deployments/quarkus/

EXPOSE 8080
USER 185

ENTRYPOINT ["java", "-jar", "/deployments/quarkus-run.jar" ]