# Chọn image Java 17
FROM openjdk:17-jdk-slim

# Chỉ định thư mục làm việc trong container
WORKDIR /app

# Sao chép mã nguồn vào container
COPY . /app

# Build ứng dụng với Maven
RUN apt-get update && apt-get install -y maven
RUN mvn clean install -DskipTests

# Expose cổng mà ứng dụng sẽ chạy trên đó
EXPOSE 8080

# Chạy ứng dụng với file JAR được build từ Maven
ENTRYPOINT ["java", "-jar", "target/docker_maven-1.0-SNAPSHOT.jar"]
