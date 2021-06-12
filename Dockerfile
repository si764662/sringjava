FROM openjdk:latest
LABEL maintainer="siva uppuluri" \
      name="hellojava" \
      version="1.0"
WORKDIR /
COPY ./app/build/libs/*.jar /
CMD ["java", "-cp", "app.jar", "sringjava.App"]

