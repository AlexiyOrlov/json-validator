#FROM alpine:3.10
#COPY entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]

FROM openjdk:8
WORKDIR src
RUN ["javac", "-cp", "../lib/json-tools-0.2.0.jar", "dev/buildtool/validator/Validator.java"]
ARG directory
CMD ["java","-classpath","lib/json-tools-0.2.0.jar","dev.buildtool.validator.Validator","$directory"]