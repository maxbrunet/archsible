#!/bin/sh
set -e

for f in "${@}"; do
  packer fmt "${f}"
done
