# Stage 1: Build WAR using Maven
FROM maven:3.8.6-openjdk-17 AS builder
WORKDIR /app
COPY pom.xml .                          # Copy pom.xml first (caches dependencies)
RUN mvn dependency:go-offline           # Pre-download dependencies
COPY src/ ./src/                        # Copy source code
RUN mvn clean package                   # Build WAR (output: /app/target/*.war)

# Stage 2: Run WAR in lightweight JRE
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY --from=builder /app/target/*.war ./app.war  # Copy WAR from Stage 1
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.war"]