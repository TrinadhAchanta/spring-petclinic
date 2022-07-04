FROM openjdk:11
VOLUME /tmp
ARG JAR_FILE=target/spring-petclinic-2.7.0-SNAPSHOT.jar
ADD ${JAR_FILE} springpet.jar
ENTRYPOINT ["java", "-jar", "/springpet.jar"]
