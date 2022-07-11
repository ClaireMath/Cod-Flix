FROM openjdk:15
COPY . /usr/src/app
WORKDIR /usr/src/app

ENTRYPOINT ["java","-jar","build/libs/codflix-backend-1.0-SNAPSHOT-all.jar"]