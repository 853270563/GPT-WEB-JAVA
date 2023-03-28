FROM luanyutop/mvnrepository AS builder
ENV TIME_ZONE Asia/Shanghai
WORKDIR /workspace
COPY . .
RUN mvn clean install -Dmaven.test.skip=true
# 以下为运行容器 切换 JDK 到对应版本
# jdk8对应：mcr.microsoft.com/java/jre:8-zulu-alpine
# jdk17对应：mcr.microsoft.com/java/jre:17-zulu-alpine
FROM mcr.microsoft.com/java/jre:17-zulu-alpine
WORKDIR /workspace
COPY --from=builder /workspace/target/GPT-SERVER.jar  /workspace
EXPOSE 8000
ENV TIME_ZONE Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime
CMD ["java", "-jar", "/workspace/GPT-SERVER.jar"]