FROM openjdk:8-jdk-alpine
MAINTAINER sanskrram992@gmail.com
WORKDIR home/ubuntu/app
RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget https://downloads.apache.org/maven/maven-3/3.8.3/binaries/apache-maven-3.8.3-bin.zip && \
    unzip apache-maven-3.8.3-bin.zip && \
    mv apache-maven-3.8.3 /usr/local/maven && \
    ln -s /usr/local/maven/bin/mvn /usr/bin/mvn

RUN mvn -version

COPY ./pom.xml home/ubuntu/app
COPY ./src home/ubuntu/app/src

RUN mvn clean install
EXPOSE 8080

RUN /home/ubuntu/app/target/demo-0.0.1-SNAPSHOT.jar /home/ubuntu/app/target/demo.jar

CMD ["java", "-jar", "target/demo.jar"]