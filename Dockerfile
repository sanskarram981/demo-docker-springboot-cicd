FROM openjdk:8

LABEL maintainer="sanskarram992@gmail.com" version="1.0" description="This is a sample Docker image"

WORKDIR /home/ubuntu/app

EXPOSE 9090

COPY ./target/demo-0.0.1-SNAPSHOT.jar ./target/demo.jar

CMD ["java", "-jar", "./target/demo.jar"]
