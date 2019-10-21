#!/bin/bash

docker run --rm \
       -e MASTER_URL=spark://spark-master:7077 \
       --network spark-docker1_spark-network \
       daeyeonjoo/spark_sample_app:2.4.4