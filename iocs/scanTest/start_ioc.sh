#!/bin/bash
ARCH=linux-$(uname -m)
BIN_PATH="bin/$ARCH/scantest"

exec "$BIN_PATH" "st.cmd"