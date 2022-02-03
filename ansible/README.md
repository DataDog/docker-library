This directory contains Dockerfiles that are used in [ansible-datadog](https://github.com/DataDog/ansible-datadog/) CI.

Historically we had a Dockerfile per distro and ansible version combination - we still keep some old ones here, as they e.g. contain old distros that run Ansible with Python 3. For Ansible >= 2.9, we use the `build.sh` script, because the Dockerfiles look pretty much the same except Ansible version installed.

For example, to build a Debian and Rocky 8 images with Ansible 4.10.\* tagged as `datadog/docker-library:ansible_debian_4_10` and `datadog/docker-library:ansible_rocky8_4_10`, you can run:

```
./build.sh debian,rocky8 4.10
```

You must always provide Ansible version as `MAJOR.MINOR`.
