FROM openjdk:8

LABEL maintainer="sanskarram992@gmail.com" version="1.0" description="This is a sample Docker image"

WORKDIR /home/ubuntu/app

ENV MAVEN_VERSION=3.8.3
ENV MAVEN_HOME=/opt/maven
ENV PATH=$MAVEN_HOME/bin:$PATH

COPY ./pom.xml /home/ubuntu/app/pom.xml
COPY ./src /home/ubuntu/app/src


RUN mvn clean install


EXPOSE 8080

RUN mv /home/ubuntu/app/target/demo-0.0.1-SNAPSHOT.jar /home/ubuntu/app/target/demo.jar

CMD ["java", "-jar", "target/demo.jar"]