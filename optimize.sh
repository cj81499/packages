#!/bin/sh

# Requires zopfli/zopflipng to be installed

# Get the number of processors on the machine
CPU_COUNT=$(nproc)
# Subtract 1 from the number of processors
MAX_PROCS=$(($CPU_COUNT-1))
# Find all png images and run zopflipng on them
# Run up to MAX_PROCS instances of zopflipng
find -iname "*.png" | xargs --max-procs=$MAX_PROCS -I{} zopflipng {} {} -y
