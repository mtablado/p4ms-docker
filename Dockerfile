FROM java:8-jre 

############## ENVIRONMENT 
ENV path=/
ENV JAVA_OPTS="-XX:+UseConcMarkSweepGC -XX:+CMSIncrementalMode --server.port=8080"
ENV MICRO=app.jar

############## FILEBEAT
# Build variables
ENV FILEBEAT_VERSION 1.2.2
ENV FILEBEAT_URL https://download.elastic.co/beats/filebeat/filebeat-${FILEBEAT_VERSION}-x86_64.tar.gz

# Environment variables
ENV FILEBEAT_HOME /opt/filebeat-${FILEBEAT_VERSION}-x86_64
ENV PATH $PATH:${FILEBEAT_HOME}  
##FILEBEAT
RUN apt-get update && \ 
    curl -L -O https://download.elastic.co/beats/filebeat/filebeat_${FILEBEAT_VERSION}_amd64.deb && \
    dpkg -i filebeat_${FILEBEAT_VERSION}_amd64.deb 
#ADD filebeat.yml /filebeat.yml 

############## START SCRIPT
#ADD start.sh start.sh
#RUN chmod +x /start.sh 

############## PORT
EXPOSE 8080
