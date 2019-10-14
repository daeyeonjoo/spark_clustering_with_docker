#!/bin/bash

docker network create spark_network

docker run -d \
           --name spark-master \
           --hostname spark-master \
           --network spark_network \
           -p 7077:7077 -p 8080:8080 \
           daeyeonjoo/spark_master:2.4.4

docker run -d \
           --name spark-worker1 \
           --hostname spark-worker1 \
           --network spark_network \
           -e MASTER_URL=spark://spark-master:7077 \
           daeyeonjoo/spark_slave:2.4.4