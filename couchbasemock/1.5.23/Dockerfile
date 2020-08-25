FROM maven:3.6.1-jdk-8-slim

# Use the bucket configuration specified in the BUCKET_LIST env var, otherwise use "default::couchbase"
#  bucket configuration is comma delimited list of "<bucket_name>:<bucket_password>:{couchbase|memcached}"
ENV BUCKET_LIST=${BUCKET_LIST:-default::couchbase}

# Get CouchbaseMock and build it
RUN apt-get update && apt-get install -y --no-install-recommends git
RUN git clone https://github.com/randomanderson/CouchbaseMock.git --branch bucket-start-port
WORKDIR CouchbaseMock
RUN mvn package

# Run CouchbaseMock using api port 8091 and carrier port 11210
ENTRYPOINT java -jar target/CouchbaseMock-1.5.23.jar -d --replicas -1 --buckets ${BUCKET_LIST} --host 127.0.0.1 --port 8091 --vbuckets 1 --nodes 1 --bucket-start-port 11210
