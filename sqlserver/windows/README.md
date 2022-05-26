
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

## SQL Server 2014

```
docker build -t datadog/docker-library:sqlserver_2014 -f Dockerfile_2014 .
```

## SQL Server 2012

```
docker build -t datadog/docker-library:sqlserver_2012 -f Dockerfile_2012 .
```
