#Build stage
FROM gradle:8.7-jdk21 as build
LABEL authors="Hilmi Yetgin <hilmi.yetgin@student.kdg.be>"
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build -x test --no-daemon

#Runtime stage
FROM openjdk:21-slim
COPY --from=build /home/gradle/src/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]
