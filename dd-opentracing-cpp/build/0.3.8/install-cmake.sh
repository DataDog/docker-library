#!/bin/sh

# Install a recent binary release of cmake.
# Kitware produces a self-installing tarball.

set -x
set -e

VERSION=3.24.1
INSTALLER=cmake-${VERSION}-linux-x86_64.sh
URL=https://github.com/Kitware/CMake/releases/download/v${VERSION}/${INSTALLER}

cd /tmp
wget "${URL}"
chmod +x "${INSTALLER}"
./"${INSTALLER}" --skip-license --prefix=/usr/local --exclude-subdir
rm "${INSTALLER}"
