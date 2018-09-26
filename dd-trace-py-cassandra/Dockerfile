# Latest image for this Dockerfile: datadog/docker-library:ddtrace_py_cassandra
FROM cassandra:3.11

RUN sed -ri 's/auto_snapshot: true/auto_snapshot: false/' "$CASSANDRA_CONFIG/cassandra.yaml"
