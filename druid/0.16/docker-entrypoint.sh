#!/bin/bash

set -e

exec "bin/run-druid" "$@" "/opt/druid_conf"
