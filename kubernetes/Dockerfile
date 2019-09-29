FROM centos:centos7

ENV CDH_VERSION     cdh5.7.6
ENV JAVA_VERSION    1.8.0

ENV HADOOP_VERSION  2.6.0-${CDH_VERSION}
ENV HIVE_VERSION    1.1.0-${CDH_VERSION}
ENV HBASE_VERSION   1.2.0-${CDH_VERSION}
ENV SPARK_VERSION   2.3.2
ENV ZK_VERSION      3.4.5-${CDH_VERSION}
ENV KAFKA_VERSION   0.10.2.2
ENV KYLIN_VERSION   2.6.3

ENV JAVA_HOME       /usr/lib/jvm/java-${JAVA_VERSION}
ENV HADOOP_HOME     /opt/hadoop-${HADOOP_VERSION}
ENV HIVE_HOME       /opt/hive-${HIVE_VERSION}
ENV HBASE_HOME      /opt/hbase-${HBASE_VERSION}
ENV SPARK_HOME      /opt/spark-${SPARK_VERSION}-bin-hadoop2.7
ENV ZK_HOME         /opt/zookeeper-${ZK_VERSION}
ENV KAFKA_HOME      /opt/kafka_2.11-${KAFKA_VERSION}
ENV KYLIN_HOME      /opt/apache-kylin-${KYLIN_VERSION}-bin-cdh57

ENV PATH $PATH:\
$JAVA_HOME/bin:\
$HADOOP_HOME/bin:\
$HIVE_HOME/bin:\
$HBASE_HOME/bin:\
$SPARK_HOME/bin:\
$KAFKA_HOME/bin:\
$KYLIN_HOME/bin

ENV HIVE_CONF    ${HIVE_HOME}/conf
ENV HCAT_HOME    ${HIVE_HOME}/hcatalog
ENV HIVE_LIB     ${HIVE_HOME}/lib

ADD hadoop-${HADOOP_VERSION}.tar.gz                 /opt
ADD hive-${HIVE_VERSION}.tar.gz                     /opt
ADD hbase-${HBASE_VERSION}.tar.gz                   /opt
ADD spark-${SPARK_VERSION}-bin-hadoop2.7.tgz        /opt
ADD zookeeper-${ZK_VERSION}.tar.gz                  /opt
ADD kafka_2.11-${KAFKA_VERSION}.tgz                 /opt
ADD apache-kylin-${KYLIN_VERSION}-bin-cdh57.tar.gz  /opt

RUN \
    set -xeu && \
    yum -y -q update && \
    yum -y -q install which && \
    yum -y -q install java-1.8.0-openjdk-devel && \
    yum -y -q install krb5-workstation && \
    yum -q clean all && \
    rm -rf /var/cache/yum && \
    rm -rf /tmp/* /var/tmp/* && \
    groupadd kylin --gid 1000 && \
    useradd kylin --uid 1000 --gid 1000 && \
    chown -R "kylin:kylin" ${KYLIN_HOME}

EXPOSE 7070
USER kylin:kylin
CMD ${KYLIN_HOME}/bin/kylin.sh run