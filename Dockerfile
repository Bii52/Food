# Build stage
FROM maven:3.9.11-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Runtime stage
FROM amazoncorretto:17-alpine3.20
WORKDIR /app
COPY --from=builder /app/target/FoodHKD-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENV SPRING_PROFILES_ACTIVE=h2
CMD ["java", "-jar", "app.jar"]
