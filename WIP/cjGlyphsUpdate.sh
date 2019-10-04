#!/bin/zsh

cd /Users/Cal/Documents/Jailbreak_Stuff/cj81499.github.io/Glyphs/Library/Themes

echo Removing .DS_Store.
find . -name ".DS_Store" -depth -exec rm {} \;

echo Removing Old Files.
rm cjGlyphs.zip

echo Zipping cjGlyphs.
zip -r -X cjGlyphs.zip cjGlyphs*

echo Done. Exiting.
exit 0
