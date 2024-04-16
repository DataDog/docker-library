# Oracle PDB

## Build

```bash
docker build -t datadog/docker-library:oracle-21-xe -f Dockerfile .
```

## Publish

```bash
docker push datadog/docker-library:oracle-21-xe
```

## Run

```bash
docker run --name ora21c-test -d -p 1521:1521/tcp docker.io/datadog/docker-library:oracle-21-xe
```