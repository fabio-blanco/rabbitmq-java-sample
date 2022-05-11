# syntax=docker/dockerfile:1.3

FROM openjdk:17-jdk-slim as base

WORKDIR /app

COPY gradle/ gradle
COPY gradlew settings.gradle ./
COPY buildSrc/build.gradle ./buildSrc/
COPY consumer/build.gradle ./consumer/
COPY producer/build.gradle ./producer/
RUN ./gradlew build || return 0
COPY . .

FROM base as execute
ENTRYPOINT ["./gradlew", "-q", "run", "-p", "consumer"]