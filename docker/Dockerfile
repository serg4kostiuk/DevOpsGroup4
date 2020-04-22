FROM tomcat:9.0-alpine

MAINTAINER denys.vbt

RUN rm -f /usr/local/tomcat/conf/tomcat-users.xml

COPY tomcat-users.xml /usr/local/tomcat/conf/
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/
COPY context.xml /usr/local/tomcat/webapps/host-manager/META-INF/
COPY  sample.war /usr/local/tomcat/webapps/sample.war

EXPOSE 8080
