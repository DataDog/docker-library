## Usage

Sample usage with docker-compose

```yaml
version: '3.5'

services:

  zookeeper:
    image: zookeeper:3.4.11

  druid-broker:
    image: datadog/docker-library:druid_1_5
    command: broker
    depends_on:
      - zookeeper
    ports:
      - 8082:8082

  druid-coordinator:
    image: datadog/docker-library:druid_1_5
    command: coordinator-overlord
    depends_on:
      - zookeeper
    ports:
      - 8081:8081

```

Available commands to start Druid processes:

- broker (port 8082)
- coordinator-overlord (port 8081)
- historical (port 8083)
- middleManager (port 8091)
- router (port 8888)
