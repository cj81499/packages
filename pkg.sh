# Check for args
if [ $# -ne 1 ]; then
    echo "usage: $0 package_id"
    exit 1
fi

# Make sure arg 1 is a directory
if [ ! -d $1 ]; then
    echo "$1 is not a directory" 1>&2
    exit 1
fi

echo "Removing old deb and zip"
rm $1.deb
rm $1.zip

echo "Creating deb"
dpkg-deb --build $1/src $1.deb

echo "Creating zip"
cd $1/src
zip -rq ../../$1.zip * -x '**DEBIAN/*'
cd ../..
