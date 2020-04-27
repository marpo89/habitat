#!/bin/sh

systemctl stop tomcat

rm -rf /opt/tomcat/webapps/ROOT/

mkdir /opt/tomcat/webapps/ROOT/

cp /home/denisjtorresg/mi-casa/build/libs/mi-casa-0.0.1-SNAPSHOT.war /opt/tomcat/webapps/ROOT/mi-casa.war

cd /opt/tomcat/webapps/ROOT/

jar xf mi-casa.war

rm -rf mi-casa.war

cp -R /opt/tomcat/webapps/ROOT/WEB-INF/classes/META-INF/resources/* /opt/tomcat/webapps/ROOT/

chown -R tomcat /opt/tomcat/webapps/ROOT/

systemctl start tomcat

