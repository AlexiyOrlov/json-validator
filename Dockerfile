FROM openjdk:9
WORKDIR /run
COPY lib/json-tools-0.2.0.jar /run/json-tools-0.2.0.jar
COPY src/dev/buildtool/validator/Validator.java /run/dev/buildtool/validator/Validator.java
RUN ["javac", "-cp", "/run/json-tools-0.2.0.jar", "/run/dev/buildtool/validator/Validator.java"]
ARG directory
ENTRYPOINT ["java","-classpath","/run/json-tools-0.2.0.jar:/run","dev.buildtool.validator.Validator"]