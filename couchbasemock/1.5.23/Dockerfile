FROM maven:3.6.1-jdk-8

RUN git clone https://github.com/randomanderson/CouchbaseMock.git --branch bucket-start-port
WORKDIR CouchbaseMock
RUN mvn package -DskipTests

EXPOSE 8091
EXPOSE 11210

ENTRYPOINT java -jar target/CouchbaseMock-1.5.23.jar -d --replicas -1 --buckets default::couchbase --host 127.0.0.1 --port 8091 --vbuckets 1 --nodes 1 --bucket-start-port 11210
