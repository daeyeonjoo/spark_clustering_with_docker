#!/bin/bash

/spark/bin/spark-class org.apache.spark.deploy.worker.Worker --webui-port 8080 $MASTER_URL