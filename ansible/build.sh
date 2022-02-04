#!/bin/bash

function help() {
  echo "build.sh DISTROS ANSIBLE_MAJOR_MINOR

Build image for the specified DISTROS and ANSIBLE_MAJOR_MINOR. For example:

build.sh rocky8 2.10
build.sh debian,suse 3.4
"
}

distros=$1
ansible_major_minor=$2

[ -n "$distros" ] || help
[ -n "$ansible_major_minor" ] || help
echo "$ansible_major_minor" | grep '^\d\+\.\d\+$' > /dev/null || help
ansible_underscored=$(echo "$ansible_major_minor" | sed "s|\.|_|")

for distro in $(echo $distros | tr "," "\n"); do
  docker build --tag "datadog/docker-library:ansible_${distro}_${ansible_underscored}" --build-arg ANSIBLE_VERSION="$ansible_major_minor" --file "$distro/Dockerfile" "$distro/"
done
