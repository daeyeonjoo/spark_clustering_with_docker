FROM daeyeonjoo/spark:2.4.4

ENV MASTER_URL=spark://spark-master:7077

RUN apk add python3
RUN cd /usr/bin \
	&& ln -s idle3 idle \
	&& ln -s pydoc3 pydoc \
	&& ln -s python3 python \
	&& ln -s python3-config python-config

RUN pip3 install pyspark

ADD slave_entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/bin/bash", "entrypoint.sh"]