FROM daeyeonjoo/spark:2.4.4

ENV MASTER_URL=spark://spark-master:7077

ADD slave_entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/bin/bash", "entrypoint.sh"]