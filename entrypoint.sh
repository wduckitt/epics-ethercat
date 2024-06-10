#!/bin/bash

# Detect architecture
ARCH=$(uname -m)

# Export the architecture as an environment variable
export ARCH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/epics/ethercat/lib/linux-$ARCH

# Call the original entrypoint or command
exec "$@"

