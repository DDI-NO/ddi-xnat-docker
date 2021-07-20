FROM tomcat:9-jdk8-openjdk-buster

#defaults to 1.8.2
ARG XNAT_VERSION=1.8.2
ARG XNAT_ROOT=/tsd/p96/data/durable/xnat
ARG XNAT_HOME=/data/xnat/home

ARG TOMCAT_XNAT_FOLDER=xnat
ARG TOMCAT_XNAT_FOLDER_PATH=${CATALINA_HOME}/webapps/${TOMCAT_XNAT_FOLDER}

#RUN rm -rf ${CATALINA_HOME}/webapps/*
RUN mkdir -p \
        ${TOMCAT_XNAT_FOLDER_PATH} \
        ${XNAT_HOME}/config \
        ${XNAT_HOME}/logs \
        ${XNAT_HOME}/plugins \
        ${XNAT_HOME}/work \
        ${XNAT_ROOT}/archive \
        ${XNAT_ROOT}/build \
        ${XNAT_ROOT}/cache \
        ${XNAT_ROOT}/ftp \
        ${XNAT_ROOT}/pipeline \
        ${XNAT_ROOT}/prearchive

ADD xnat-web-${XNAT_VERSION}.war /tmp/xnat-web-${XNAT_VERSION}.war
#RUN wget --no-verbose --output-document=/tmp/xnat-web-${XNAT_VERSION}.war https://api.bitbucket.org/2.0/repositories/xnatdev/xnat-web/downloads/xnat-web-${XNAT_VERSION}.war
RUN unzip -o -d ${TOMCAT_XNAT_FOLDER_PATH} /tmp/xnat-web-${XNAT_VERSION}.war
RUN rm -f /tmp/xnat-web-${XNAT_VERSION}.war

EXPOSE 8080

ENV XNAT_HOME=${XNAT_HOME}

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
