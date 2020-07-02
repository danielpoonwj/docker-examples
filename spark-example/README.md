## Reference

https://hub.docker.com/r/bitnami/spark

## Pyspark shell

### Launch adhoc container

```
docker-compose run --rm spark-master /bin/bash
```

### Start pyspark shell referencing master

```bash
./bin/pyspark --master spark://spark-master:7077
```

### Run test code in pyspark to read mounted data

```bash
txt = sc.textFile('file:////tmp/data/test.csv')
txt.collect()
```
