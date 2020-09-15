# Install FROM AMAZON LINUX 2
FROM amazonlinux:latest

#Author of the Docker File
# MAINTAINER Pictolearn Note: MAINTAINER has been deprecated for LABEL, 
# LABEL is a key value pair 
LABEL "Maintainer"="adawar"

# RUN COMMAND BASICALLY runs the command in the terminal and creates an image.
# Install all the updates for UBUNTU
##RUN apt-get update && apt-get install -y python-software-properties software-properties-common
RUN yum update -y

# Install all the updates for UBUNTU
#RUN apt-get install -y iputils-ping

# Adds the repository where JDK 8 can be obtained for UBUNTU
##RUN add-apt-repository ppa:webupd8team/java

# INSTALL THE VI EDITOR AND MYSQL-CLIENT
#RUN yum install -y ps
RUN yum install -y vim
RUN yum install -y curl
RUN yum install -y wget
RUN yum install -y tar


#RUN apt-get install -y mysql-client

# NOTE and WARNING: ORACLE JDK is no longer licensed. Please install default jdk or OPEN JDK. 
# The initial set up was to get this working with JDK 7 but when the licensing terms for oracle changing we will install the default JDK
# INSTALL ORACLE JDK 8 BY ACCEPTING YES
# RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections
#INSTALL ALL the updates again and install MAVEN and JDK 8
# RUN apt-get update && apt-get install -y oracle-java8-installer maven
##RUN apt-get update && apt-get install -y default-jdk maven
RUN yum update && yum install -y java-1.8.0-openjdk maven

#RUN cd /opt
#RUN mkdir apache-tomcat-8.5.35
RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.35/bin/apache-tomcat-8.5.35.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvzf tomcat.tar.gz

RUN mkdir /usr/local/tomcat
RUN cp -R /tmp/apache-tomcat-8.5.35/* /usr/local/tomcat/

#RUN cp -Rv /tmp/apache-tomcat-8.5.35/* /opt/apache-tomcat-8.5.35/
#RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.35/bin/apache-tomcat-8.5.35.tar.gz
#RUN cd /opt/ && tar -xvzf /opt/apache-tomcat-8.5.35.tar.gz

#RUN cd /opt/apache-tomcat-8.5.35/bin &&  chmod +x *.sh

#RUN cd /opt/apache-tomcat-8.5.35/bin/
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run

#CMD /opt/apache-tomcat-8.5.35/bin/catalina.sh run

# ADD a directory called docker-git-hello-world inside the UBUNTU IMAGE where you will be moving all of these files under this 
# DIRECTORY to
#ADD . /usr/local/docker-git-hello-world

# AFTER YOU HAVE MOVED ALL THE FILES GO AHEAD CD into the directory and run mvn assembly.
# Maven assembly will package the project into a JAR FILE which can be executed
#RUN cd /usr/local/docker-git-hello-world && mvn assembly:assembly

#THE CMD COMMAND tells docker the command to run when the container is started up from the image. In this case we are
# executing the java program as is to print Hello World.
##CMD ["java", "-cp", "/usr/local/docker-git-hello-world/target/docker-git-hello-world-0.0.1-SNAPSHOT-jar-with-dependencies.jar", "com.adawar.docker.HelloWorldPing"]
#CMD ["java", "-cp", "/usr/local/docker-git-hello-world/target/docker-git-hello-world-1.0.0-SNAPSHOT-jar-with-dependencies.jar", "com.adawar.docker.HelloWorldPing"]
