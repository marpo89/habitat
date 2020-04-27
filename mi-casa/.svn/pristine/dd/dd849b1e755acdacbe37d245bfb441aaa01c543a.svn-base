#!/bin/sh

cd ~

##svn checkout --username denisjtorresg  http://dev.denisjtorresg.info/erpuno/trunk/mi-casa/

cd mi-casa

svn --username denisjtorresg update 

./gradlew clean
./gradlew jar
./gradlew bootRepackage


