# Presto Cluster for E2E Dev Testing

## Introduction

This project contains a Dockerfile that pulls in a Presto docker image ([lewuathe/presto-base](https://github.com/Lewuathe/docker-presto-cluster)),
which is sync'd with the master branch of the [Presto SQL repository](https://github.com/prestosql/presto). It deploys a multi-node
Presto cluster containing:

* 1 Coordinator node
* 2 Worker nodes

Node configuration files are located in the `/etc` directory and is configured with the [JMX Connector](https://prestodb.github.io/docs/current/connector/jmx.html) by default. 

## How to deploy cluster

### From `ddev` CLI

Run the following command to start the presto dev cluster with a JMX-based agent image:

```
ddev env start presto <env-version> -a datadog/agent:<version-tag>-jmx
```

E.g.

```
ddev env start presto py27-latest -a datadog/agent:6.10.0-jmx
```

### Deploy locally

Create a `docker-compose.yaml` with the following minimum specifications:

```
version: '3'

# Adapted from https://github.com/Lewuathe/docker-presto-cluster
services:
  coordinator:                          # REQUIRED: single coordinator node
    build:
      context: datadog/docker-library:presto
      args:
        NODE_TYPE: coordinator          # Presto node type (Coordinator/Worker)
        NODE_ID: coordinator            # Presto node ID (required arbitrary value for naming and creating node)
        VERSION: latest                 # Presto version tag (available tags: https://hub.docker.com/r/lewuathe/presto-base/tags)
    container_name: presto_coordinator
    ports:
      - "8080:8080"                     # Expose HTTP Server port
      - "9997:9999"                     # Expose port to Remote JMX connection

  worker1:                              # Add/remove worker nodes to your specifications
    build:
      context: datadog/docker-library:presto
      args:
        NODE_TYPE: worker
        NODE_ID: worker1
        VERSION: latest
    container_name: presto_worker1      
    ports:
      - "8081:8080"
      - "9998:9999"

  worker2:
    build:
      context: datadog/docker-library:presto
      args:
        NODE_TYPE: worker
        NODE_ID: worker2
        VERSION: latest
    container_name: presto_worker2
    ports:
      - "8082:8080"
      - "9999:9999"
```

Deploy `docker-compose.yaml`:

```
docker-compose up -d --build
```

## Notes
- This image does not include the Presto CLI for running queries. See docs for installing CLI: https://prestosql.io/docs/current/installation/cli.html
- After installing CLI, you can run queries or query JMX metrics: https://www.tutorialspoint.com/apache_presto/apache_presto_jmx_connector.htm

## Resources
- https://github.com/Lewuathe/docker-presto-cluster
- https://github.com/prestosql/presto
- https://prestosql.io/docs/current/index.html
