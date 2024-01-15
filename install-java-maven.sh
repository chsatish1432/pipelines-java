#!/bin/bash
set -x

# Creating specified path
sudo mkdir -p /opt/cici-tools

# Install Java
sudo apt-get update
#sudo apt-get install -y openjdk-11-jdk
wget https://download.java.net/java/GA/jdk13.0.1/cec27d702aa74d5a8630c65ae61e4305/9/GPL/openjdk-13.0.1_linux-x64_bin.tar.gz
tar -xvf openjdk-13.0.1_linux-x64_bin.tar.gz
sudo mv jdk-13.0.1 /opt/cici-tools/java


# Install Maven
#sudo apt-get install -y maven
wget https://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
tar -xvf apache-maven-3.6.3-bin.tar.gz
sudo mv apache-maven-3.6.3 /opt/cici-tools/maven


# Update environment variables
cat ~/.bashrc|grep JAVA_HOME
if [ $? -eq 0 ]; then 
  echo "already JAVA_HOME path available"
else
  echo 'export JAVA_HOME=/opt/cici-tools/java' >> ~/.bashrc
fi

cat ~/.bashrc|grep MAVEN_HOME
if [ $? -eq 0 ]; then 
  echo "already MAVEN_HOME path available"
else
  echo 'export MAVEN_HOME=/opt/cici-tools/maven' >> ~/.bashrc
fi

echo $PATH|grep java
if [ $? -eq 0 ]; then 
  echo "PATH already has java location"
else
  echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc
fi

echo $PATH|grep maven
if [ $? -eq 0 ]; then 
  echo "PATH already has maven location"
else
  echo 'export PATH=$MAVEN_HOME/bin:$PATH' >> ~/.bashrc
fi

source ~/.bashrc

java -version

mvn -version

