# docker-library

A Dockerfiles compilation for custom images.

The images must be pushed manually to Docker Hub to make them available:

```shell script
docker build -t datadog/docker-library:<IMAGE_TAG> <BUILD_DIR>
docker push datadog/docker-library:<IMAGE_TAG>
```

Pull command:

```shell script
docker pull datadog/docker-library:<IMAGE_TAG>
```

Currently available tags:

* [`ansible_2_4`](https://github.com/DataDog/docker-library/tree/master/ansible/2.4): Ansible v2.4
* [`ansible_2_5`](https://github.com/DataDog/docker-library/tree/master/ansible/2.5): Ansible v2.5
* [`ansible_2_6`](https://github.com/DataDog/docker-library/tree/master/ansible/2.6): Ansible v2.6
* [`ansible_2_7`](https://github.com/DataDog/docker-library/tree/master/ansible/2.7): Ansible v2.7
* [`ansible_2_8`](https://github.com/DataDog/docker-library/tree/master/ansible/2.8): Ansible v2.8
* [`chef_kitchen_systemd_centos_6`](https://github.com/DataDog/docker-library/tree/master/chef-kitchen/systemd/centos6): Chef Kitchen image for testing systemd services on Centos 6
* [`chef_kitchen_systemd_centos_7`](https://github.com/DataDog/docker-library/tree/master/chef-kitchen/systemd/centos7): Chef Kitchen image for testing systemd services on Centos 7
* [`couch_2_3`](https://github.com/DataDog/docker-library/tree/master/couch/2.3): Couch v2.3.1 with development cluster
* [`dd_opentracing_cpp_ubuntu_16.04_0_2_1`](https://github.com/DataDog/docker-library/tree/master/dd-opentracing-cpp/ubuntu_16.04/0.2.1): Base image for CircleCI build of C++ OpenTracing integration (Ubuntu 16.04)
* [`dd_opentracing_cpp_ubuntu_18.04_0_2_1`](https://github.com/DataDog/docker-library/tree/master/dd-opentracing-cpp/ubuntu_18.04/0.2.1): Base image for CircleCI build of C++ OpenTracing integration (Ubuntu 18.04)
* [`ddtrace_csharp_0_1_0`](https://github.com/DataDog/docker-library/tree/master/dd-trace-csharp/0.1.0): C# test runner v.0.1.0
* [`ddtrace_php_5_6`](https://github.com/DataDog/docker-library/tree/master/dd-trace-php/Dockerfile_56): Test runner for PHP version 5.6
* [`ddtrace_php_7_0`](https://github.com/DataDog/docker-library/tree/master/dd-trace-php/Dockerfile_70): Test runner for PHP version 7.0
* [`ddtrace_php_7_1`](https://github.com/DataDog/docker-library/tree/master/dd-trace-php/Dockerfile_71): Test runner for PHP version 7.1
* [`ddtrace_php_7_2`](https://github.com/DataDog/docker-library/tree/master/dd-trace-php/Dockerfile_72): Test runner for PHP version 7.2
* [`ddtrace_py`](https://github.com/DataDog/docker-library/tree/master/dd-trace-py): Test runner for Python
* [`ddtrace_rb_1_9_3`](https://github.com/DataDog/docker-library/tree/master/dd-trace-rb/1.9.3): Test runner for Ruby version 1.9.3
* [`ddtrace_rb_2_0_0`](https://github.com/DataDog/docker-library/tree/master/dd-trace-rb/2.0.0): Test runner for Ruby version 2.0.0
* [`ddtrace_rb_2_1_10`](https://github.com/DataDog/docker-library/tree/master/dd-trace-rb/2.1.10): Test runner for Ruby version 2.1.10
* [`ddtrace_rb_2_2_10`](https://github.com/DataDog/docker-library/tree/master/dd-trace-rb/2.2.10): Test runner for Ruby version 2.2.10
* [`ddtrace_rb_2_3_7`](https://github.com/DataDog/docker-library/tree/master/dd-trace-rb/2.3.7): Test runner for Ruby version 2.3.7
* [`ddtrace_rb_2_3_8`](https://github.com/DataDog/docker-library/tree/master/dd-trace-rb/2.3.8): Test runner for Ruby version 2.3.8
* [`ddtrace_rb_2_4_4`](https://github.com/DataDog/docker-library/tree/master/dd-trace-rb/2.4.4): Test runner for Ruby version 2.4.4
* [`ddtrace_rb_2_4_6`](https://github.com/DataDog/docker-library/tree/master/dd-trace-rb/2.4.6): Test runner for Ruby version 2.4.6
* [`druid_0_16`](https://github.com/DataDog/docker-library/tree/master/druid/0.16): Druid v.0.16.0-incubating
* [`elasticsearch_0_90`](https://github.com/DataDog/docker-library/tree/master/elasticsearch/0.90): Elasticsearch v.0.90.13
* [`elasticsearch_1_0`](https://github.com/DataDog/docker-library/tree/master/elasticsearch/1.0): Elasticsearch v.1.0
* [`elasticsearch_1_1`](https://github.com/DataDog/docker-library/tree/master/elasticsearch/1.1): Elasticsearch v.1.1
* [`elasticsearch_1_2`](https://github.com/DataDog/docker-library/tree/master/elasticsearch/1.2): Elasticsearch v.1.2
* [`kyototycoon_0_9_56`](https://github.com/DataDog/docker-library/tree/master/kyototycoon/0.9.56): Kyototycoon v.0.9.56
* [`memcached_SASL`](https://github.com/DataDog/docker-library/tree/master/memcached)
* [`nginx-vts`](https://github.com/DataDog/docker-library/tree/master/nginx-vts)
* [`pgbouncer_1_7`](https://github.com/DataDog/docker-library/tree/master/pgbouncer/1.7)
* [`pgbouncer_1_8`](https://github.com/DataDog/docker-library/tree/master/pgbouncer/1.8)
* [`powerdns_recursor_3_7_3`](https://github.com/DataDog/docker-library/tree/master/powerdns\_recursor/3.7.3): Powerdns Recursor v.3.7.3
* [`powerdns_recursor_4_0_3`](https://github.com/DataDog/docker-library/tree/master/powerdns\_recursor/4.0.3): Powerdns Recursor v.4.0.3
* [`powerdns_recursor_4_0_9`](https://github.com/DataDog/docker-library/tree/master/powerdns\_recursor/4.0.9): Powerdns Recursor v.4.0.9
* [`snmp`](https://github.com/DataDog/docker-library/tree/master/snmp): Image for SNMP testing with [snmpsim](http://snmplabs.com/snmpsim/quickstart.html)
* [`supervisord_3_3_0`](https://github.com/DataDog/docker-library/tree/master/supervisord/3.3.0): Supervisord v.3.3.0
* [`varnish_4_1_7`](https://github.com/DataDog/docker-library/tree/master/varnish/4.1.7): Varnish v.4.1.7
* [`varnish_5_0_0`](https://github.com/DataDog/docker-library/tree/master/varnish/5.0.0): Varnish v.5.0.0

Middle stage image:

* [`chef_kitchen_systemd_scripts_0.1`](https://github.com/DataDog/docker-library/tree/master/chef-kitchen/systemd/scripts/0.1): Middlestage image having the scripts necessary for simulating systemd
