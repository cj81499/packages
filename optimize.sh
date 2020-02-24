#!/bin/sh

find -iname "*.png" -exec zopflipng {} {} -y \;
