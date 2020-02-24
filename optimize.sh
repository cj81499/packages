#!/bin/sh

# Find all png images and run zopflipng on them
# Requires zopfli/zopflipng to be installed
find -iname "*.png" -exec zopflipng {} {} -y \;
