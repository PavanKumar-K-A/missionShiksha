#FROM adoptopenjdk/maven-openjdk8
#VOLUME /tmp
#RUN mkdir -p /home/project
#RUN cd /home/project
FROM ubuntu:16.04
#FROM openjdk:8-jdk-alpine
LABEL Karteek Bhat <karteek.bhat@outlook.com>
RUN  apt-get -y update

RUN  apt-get -y install openjdk-8-jdk

RUN apt-get -y install curl tar bash
#RUN apk add --no-cache curl tar bash procps
# Downloading and installing Maven
# 1- Define a constant with the version of maven you want to install
ARG MAVEN_VERSION=3.6.1         
# 2- Define a constant with the working directory
ARG USER_HOME_DIR="/root"
# 3- Define the SHA key to validate the maven download
ARG SHA=b4880fb7a3d81edd190a029440cdf17f308621af68475a4fe976296e71ff4a4b546dd6d8a58aaafba334d309cc11e638c52808a4b0e818fc0fd544226d952544
# 4- Define the URL where maven can be downloaded from
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries
# 5- Create the directories, download maven, validate the download, install it, remove downloaded file and set links
RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
  && echo "Downloading maven" \
  && curl -fsSL -o /tmp/apache-maven.tar.gz https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  \
  && echo "Checking download hash" \
  && echo "${SHA}  /tmp/apache-maven.tar.gz" | sha512sum -c - \
  \
  && echo "Unziping maven" \
  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
  \
  && echo "Cleaning and setting links" \
  && rm -f /tmp/apache-maven.tar.gz \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
# 6- Define environmental variables required by Maven, like Maven_Home directory and where the maven repo is located
ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"
RUN echo "Downloading Github CLI."

RUN apt-get -y install git-core
ENV TOKEN=$GIT_TOKEN
RUN git config --global url.https://${TOKEN}:@github.com/.insteadOf https://github.com/
RUN mkdir /home/project

