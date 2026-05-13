FROM tomcat:9.0-jdk11-temurin

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy our war (renamed to ROOT.war)
COPY target/ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]