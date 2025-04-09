FROM openjdk:8-jdk-alpine

#RUN apt-get update && apt-get upgrade -y

RUN apk add --no-cache git

# Скачиваем и устанавливаем Apache Ant
RUN wget https://archive.apache.org/dist/ant/binaries/apache-ant-1.10.12-bin.tar.gz \
    && tar xzf apache-ant-1.10.12-bin.tar.gz \
    && mv apache-ant-1.10.12 /usr/local/ant \
    && ln -s /usr/local/ant/bin/ant /usr/bin/ant

# Добавляем переменную окружения PATH
ENV ANT_HOME=/usr/local/ant
ENV PATH=${ANT_HOME}/bin:${PATH}

WORKDIR /app/new_ant_proj

COPY ./src ./src
COPY ./build.xml ./

RUN ant compile jar

#RUN git clone https://github.com/nastya1989db/new_ant_proj.git

#WORKDIR /app/new_ant_proj

#COPY . .

#RUN ant

#EXPOSE 8080

#RUN cp build/jar/src/*.jar /build/jar/src/*.jar

#RUN mv build/jar/HelloAnt.jar /HelloAnt.jar

#CMD ["java", "-jar", "/app/new_ant_proj/target/HelloAnt.jar"]
CMD ["java", "-jar", "/app/new_ant_proj/jar/HelloAnt.jar"]
