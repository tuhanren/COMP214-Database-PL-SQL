# [Hadoop](hadoop.apache.org)

An alternative file system (HDFS/GFS) with a processing library. Supplement of RDBMS and NoSQL.  
Hadoop processes run in separate JVMs (Java Virtual Machines) and **JVMs do not share state**. It is crucial to understand JVMs do not share state.  

**Two components plus projects:**
    - Open source data storage: **Hadoop file system (HDFS)**, three copies of data on three different servers by default.  
    - Processing API/framework: **MapReduce**
    - Other projects/libraries: **HBase, Hive, Pig**, etc.  

## Hadoop Distributions

- Open Source: **Apache Hadoop** (better stay 1/2 versions behind current release)
- Commercial: **Cloudera, Hortonworks, MapR**
  1. Cloudera, [HUE Online Playground](demo.gethue.com)
  2. Cloudera Hadoop Virtual Machine (VM) for Virtual Box on Windows, enterprise edition for development. **QuickStart VMs**.  
- Cloud: AWS (such as AWS + MapR or AWS + Apache Hadoop), Windows Azure HDInsight  

We can use Cloud Dataproc from Google cloud platform (GCP), EMR from AWS, which are PaaS provide Apache Hadoop. In this case, we are using cloud file system (Amazon S3 file system).  

### GCP Cloud Dataproc

    # shell command to deploy the setting of Hadoop
    gcloud dataproc clusters create hadoop-demo --enable-component-gateway --region asia-east1 --subnet default --zone asia-east1-c --master-machine-type n1-standard-4 --master-boot-disk-size 500 --num-workers 2 --worker-machine-type n1-standard-2 --worker-boot-disk-size 500 --image-version 1.4-ubuntu18 --optional-components ANACONDA,HIVE_WEBHCAT,JUPYTER,DRUID,PRESTO,ZOOKEEPER --project hadooptest-288515

## Core Libraries

### HDFS (& other file system for Hadoop)

Traditional file systems are 8K, by default, the chunk in HDFS is 64K or 128K. Two modes for implementation: distributed and pseudo-distributed (for testing on single machine).  

- Single node Hadoop (standalone): local file system and single JVM. This is useful for debugging.  
- Pseudo-distributed Hadoop:  use HDFS, single-node but separate Java processes.  
- Fully-distributed: HDFS, triple replicated, multi-location Java processes.  

### MapReduce

MapReduce is a method of programming (programming paradigm)
A batch processing often uses Java and works (query) directly on HDFS.  
MapReduce v2, which is YARN(Yet Another Resource Navigator).  
  
### HBase and HIVE

HBase is a NoSQL database (wide columnstore), which means there are multiple values mapped to a key.
HBase is a library, using create table method to generate wide column data table from HDFS. Then, one can use HIVE to query HBase.  

### Zookeeper

Works in combination with Sqoop, Zoopkeeper is coordination of groups of jobs.  
The Apache ZooKeeper component is a centralized service for providing distributed synchronization of data.  

### Apache Spark

For in-memory distributed data processing, conceptually similarly to MapReduce, but primarily uses memory instead of disk. Apache Spark fast, general purpose processing engine.  

## CAP Theory  

### Consistency

Such as certain database solutions support transactions, which means two data modification steps should as as a unit.  

### Availability  

Also means up-time. To achieve this, you need to make copies of data. If one copy does down in one location, data will still be available to some or all users.

### Partitioning

Also means scalability, which is to split data across multiple processing locations.

### One DBMS ONLY Meet Two

Hadoop is designed for partitioning.  
    - Can run on cheap servers (commodity hardware)
    - Make THREE copies by default (availability)  
    - Distributed processing  

## Why not use relational database (RDBMS)  

Limits in:  
    - Scalability  
        - Real time (Data ingest and speed)  
        - Queryability  
        - Sophisticated processing  

## Data for Hadoop

1. LOB (line of business) data.  

    - Usually transactional
    - Not for Hadoop
    - Should stay in relational database

2. Behavioral Data (True Big Data)

    - Batched processed
    - Great fit for Hadoop

Such as Fitbit walk data.  
