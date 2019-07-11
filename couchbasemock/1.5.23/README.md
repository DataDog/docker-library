# CouchbaseMock Docker Image
---
This is a Docker image that spins up a mock Couchbase server for easy testing. This image is based off of [CouchbaseMock][1] and uses [@randomanderson's fork][2] to ensure that the starting port for buckets is `11210`.

[1]: https://github.com/couchbase/CouchbaseMock
[2]: https://github.com/randomanderson/CouchbaseMock

---

To configure your tests, please use `8091` as the default port and `11210` as the carrier port.
