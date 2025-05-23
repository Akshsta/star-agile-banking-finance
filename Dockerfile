root@ip-172-31-86-9:/home/ubuntu/star-agile-banking-finance# cat Dockerfile
FROM openjdk:11
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

# Use official OpenJDK image as base
FROM openjdk:17-jdk-alpine

# Add a volume pointing to /tmp
VOLUME /tmp

# Copy the executable jar file
COPY target/banking-0.0.1-SNAPSHOT.jar app.jar


# Expose port 8080
EXPOSE 8081

# Run the jar file
ENTRYPOINT ["java","-jar","/app.jar"]
