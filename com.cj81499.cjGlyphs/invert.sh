#!/bin/sh

# Invert all pngs in a directory (and that directory's children)
# Requires ImageMagic to be installed
mogrify -negate -channel RGB **/*.png
