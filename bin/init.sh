#!/bin/bash

set -eu

env_file=.env
env_sample_file=.env.sample

if [ ! -f "$env_file" ]; then
  cp "$env_sample_file" "$env_file"
  echo "file $env_file created."
fi
