#!/bin/bash

/spark/bin/spark-submit --master $MASTER_URL --class \
    org.apache.spark.examples.SparkPi \
    /spark/examples/jars/spark-examples_2.11-2.4.4.jar 1000