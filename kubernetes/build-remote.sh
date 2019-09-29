#!/usr/bin/env bash

CDH_VERSION=cdh5.7.6

HADOOP_VERSION=2.6.0-${CDH_VERSION}
HIVE_VERSION=1.1.0-${CDH_VERSION}
HBASE_VERSION=1.2.0-${CDH_VERSION}
SPARK_VERSION=2.3.2
ZK_VERSION=3.4.5-${CDH_VERSION}
KAFKA_VERSION=0.10.2.2
KYLIN_VERSION=2.6.3

HADOOP_LOCATION="https://archive.cloudera.com/cdh5/cdh/5/hadoop-${HADOOP_VERSION}.tar.gz"
HIVE_LOCATION="https://archive.cloudera.com/cdh5/cdh/5/hive-${HIVE_VERSION}.tar.gz"
HBASE_LOCATION="https://archive.cloudera.com/cdh5/cdh/5/hbase-${HBASE_VERSION}.tar.gz"
SPARK_LOCATION="https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop2.7.tgz"
ZK_LOCATION="https://archive.cloudera.com/cdh5/cdh/5/zookeeper-${ZK_VERSION}.tar.gz"
KAFKA_LOCATION="https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_2.11-${KAFKA_VERSION}.tgz"
KYLIN_LOCATION="http://mirrors.tuna.tsinghua.edu.cn/apache/kylin/apache-kylin-${KYLIN_VERSION}/apache-kylin-${KYLIN_VERSION}-bin-cdh57.tar.gz"

WORK_DIR="$(mktemp -d)"

wget -P ${WORK_DIR} ${HADOOP_LOCATION}
wget -P ${WORK_DIR} ${HIVE_LOCATION}
wget -P ${WORK_DIR} ${HBASE_LOCATION}
wget -P ${WORK_DIR} ${SPARK_LOCATION}
wget -P ${WORK_DIR} ${ZK_LOCATION}
wget -P ${WORK_DIR} ${KAFKA_LOCATION}
wget -P ${WORK_DIR} ${KYLIN_LOCATION}

docker build ${WORK_DIR} -f Dockerfile -t "kylin:${KYLIN_VERSION}-cdh57"

rm -r ${WORK_DIR}
