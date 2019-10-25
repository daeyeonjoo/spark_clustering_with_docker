# 실행 방법

## Overview

Docker를 기반으로 Spark의 Master와 Worker를 구성한다. 새로운 Worker 노드는 새로운 Slave 이미지를 실행함으로써 가능하다.a





## 샘플 앱 실행 및 결과 확인

```bash
./run_sample.sh
```

샘플앱이 실행되며, 계산이 진행된다. 결과 확인은 http://localhost:8080으로 접속한다. 



## 클러스터 실행 (docker-compose)

```bash
docker-compose up
docker-compose up --scale spark-slave=3
```

Docker-compose를 이용해 클러스터를 실행할 수 있다. 이 경우 --scale 옵션을 활용해 slave의 갯수를 조절할 수 있다.



## 클러스터 실행 (docker)

### 클러스터 구성 및 실행

```
./run_cluster.sh
```

위 스크립트를 실행하면 1개의 Master, 1개의 Worker 노드로 구성된 Spark 클러스터가 만들어 진다.



### 새로운 워커 노드 추가

```bash
docker run -d \
           --name <#name> \
           --hostname <#name> \
           --network spark_network \
           -e MASTER_URL=spark://spark-master:7077 \
           daeyeonjoo/spark_slave:2.4.4
```



<#name>에 새로운 worker 노드의 이름을 입력한다.  기본적으로 생성되는 worker 노드의 이름은 spark-worker1이다. 위의 명령어를 실행한 후 http://localhost:8080에서 확인해보면 새로운 Worker 노드가 추가된 것을 확인할 수 있다.



### 클러스터 삭제

```bash
./shutdown_cluster.sh
```

위의 스크립트를 통해 기본 생성된 Master, Worker노드를 삭제한다.  임의로 추가한 Worker노드는 다음의 docker 명령어로 삭제한다.



```bash
docker rm -f <#name>
```

<#name>에 임의로 추가한 Worker노드 이름을 입력하고 실행하면 컨테이너가 삭제된다.
