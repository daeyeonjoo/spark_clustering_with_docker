#!/bin/bash

docker run --rm \
       -e MASTER_URL=spark://spark-master:7077 \
       --network spark_network \
       daeyeonjoo/spark_sample_app:2.4.4