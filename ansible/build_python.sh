#!/bin/bash

set -euo pipefail

ansible_major=$(printf "${ANSIBLE_VERSION}" | cut -f1 -d'.')

# Decide on python version depending on Ansible major version
if [[ "${ansible_major}" -ge 7 ]]; then
    python_version=3.10.14
else
    python_version=3.8.19
fi

download_url="https://python.org/ftp/python/${python_version}/Python-${python_version}.tgz"
relative_path="Python-${python_version}"
archive_name="$(basename ${download_url})"
workdir="/tmp/build-${archive_name}"
mkdir -p "${workdir}"

# Download and install Python
curl "${download_url}" -L | tar -xzC "${workdir}" --
pushd "${workdir}/${relative_path}"
./configure --prefix="${ANSIBLE_PYTHON_PATH}" --with-ensurepip=yes --enable-ipv6
make -j $(nproc)
make install
popd
rm -rf "${workdir}"
