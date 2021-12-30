
# SQL Server Windows Containers

[Microsoft SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) installed into a [Windows Server Core](https://hub.docker.com/_/microsoft-windows-servercore) Container.

# Versions

## SQL Server 2019

```
docker build -t datadog/docker-library:sqlserver_2019 -f Dockerfile_2019 .
```

## SQL Server 2017
```
docker build -t datadog/docker-library:sqlserver_2017 -f Dockerfile_2017 .
```

## SQL Server 2016

```
docker build -t datadog/docker-library:sqlserver_2016 -f Dockerfile_2016 .
```
