#FROM alpine:3.10
#COPY entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]

FROM openjdk:8
WORKDIR /run
COPY lib/json-tools-0.2.0.jar /run/json-tools-0.2.0.jar
COPY src/dev/buildtool/validator/Validator.java /run/dev/buildtool/validator/Validator.java
RUN ["javac", "-cp", "/run/json-tools-0.2.0.jar", "/run/dev/buildtool/validator/Validator.java"]
ARG directory
CMD ["java","-classpath","/run/json-tools-0.2.0.jar","/dev.buildtool.validator.Validator","$directory"]