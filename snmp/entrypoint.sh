#!/bin/sh

exit_code=0
for f in /usr/snmpsim/data/*.snmprec
do
  if ! sort -c -V "$f" 1>/dev/null 2>&1; then
    echo -e "\e[31mFile $f is not sorted, please fix your file with the command 'sort -V $f | uniq'!\e[0m"
    exit_code=$((exit_code+1))
  fi
done

if [ ! $exit_code -eq 0 ]; then
  exit $exit_code
fi
snmpsimd.py "$@"
