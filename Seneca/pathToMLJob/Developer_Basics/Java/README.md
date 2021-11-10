# Java

## Install Latest Java (09.15.2020)

  1. [Java SE JDK 15 Linux 64-bit](https://www.oracle.com/java/technologies/javase-jdk15-downloads.html), Oracle account required. Choose Linux Compressed Archive.  
  2. Follow the [instruction](https://www.java.com/en/download/help/linux_x64_install.xml), install the *jdk-15.tar.gz* to **/usr/java/**. The **sudo** command is always required to work in **/usr/java/**.  
  3. Then set commands for Terminal, 15 is the priority weight for update-alternatives:

    #Login as root, instead of using sudo all the time
    sudo su 
    #update alternatives so the command java point to the new jdk 
    sudo update-alternatives --install /usr/bin/java java /usr/java/jdk-15/bin/java 15 
    #update alternatives so the command javac point to the new jdk 
    sudo update-alternatives --install /usr/bin/javac javac /usr/java/jdk-15/bin/javac 15

    #check if java command is pointing to " link currently points to /opt/jdk/jdk1.8.0_05/bin/java"
    update-alternatives --display java

    #check if java command is pointing to " link currently points to /opt/jdk/jdk1.8.0_05/bin/javac"
    update-alternatives --display javac

    #check if java is running
    java -version

## JRE

Java Runtime Environment (JRE) is needed to run Java programs (Java applications).  

## JDK

Java Development Kit includes JRE, compilers, debuggers and other tools to create Java programs.  
Java SE (standard edition) from Oracle.  

## Books

### Head First Java

A source code file (with .java extension) holds one class definition. A class has one or more methods (functions). When a JVM starts running, it looks for the **main** method:  

    public static void main (String() args){

    }

Every Java application has at least one class and one main method. Every statement in the method must end in a semicolon.  