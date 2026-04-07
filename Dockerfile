FROM openjdk:17-slim
WORKDIR /app
COPY . .
RUN apt-get update && apt-get install -y dos2unix
RUN dos2unix ./mvnw || true
RUN chmod +x ./mvnw
RUN ./mvnw clean package -DskipTests
EXPOSE 8080
ENV SPRING_PROFILES_ACTIVE=prod
CMD ["java", "-jar", "target/FoodHKD-0.0.1-SNAPSHOT.jar"]
