
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/banking-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]



FROM openjdk:17-jdk-alpine


VOLUME /tmp


COPY target/banking-0.0.1-SNAPSHOT.jar app.jar


EXPOSE 8081

ENTRYPOINT ["java","-jar","/app.jar"]
