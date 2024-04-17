# Oracle 21 Express Edition

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
docker run --name ora21c-test -d -p 1521:1521/tcp datadog/docker-library:oracle-21-xe
```

## Connect

```bash
sqlplus c##datadog/datadog@localhost:1521/xe
```

