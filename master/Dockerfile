FROM daeyeonjoo/spark:2.4.4

EXPOSE 7077
EXPOSE 8080

ADD master_entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
