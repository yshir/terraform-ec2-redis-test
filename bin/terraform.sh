#!/bin/bash

set -eu

docker compose run --rm terraform $@
