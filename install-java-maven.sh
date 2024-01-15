#!/bin/bash
set -x

# Install Java
sudo apt-get update
sudo apt-get install -y openjdk-11-jdk

# Install Maven
sudo apt-get install -y maven

# Move to the specified path
sudo mkdir -p /opt/cici-tools
sudo mv /usr/lib/jvm/java-11-openjdk-amd64 /opt/cici-tools/java
sudo mv /usr/share/maven /opt/cici-tools/maven

# Update environment variables
echo 'export JAVA_HOME=/opt/cici-tools/java' >> ~/.bashrc
echo 'export MAVEN_HOME=/opt/cici-tools/maven' >> ~/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

