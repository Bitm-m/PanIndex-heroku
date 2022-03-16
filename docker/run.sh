#!/bin/bash
version="$PAN_INDEX_VERSION"
if [ "$version" = "" ]
then
    version=`curl --silent "https://api.github.com/repos/libsgh/PanIndex/releases/latest" \
        | grep '"tag_name":' \
        | sed -E 's/.*"([^"]+)".*/\1/'`
fi
echo $version
curl -sOL "https://github.com/libsgh/PanIndex/releases/download/${version}/PanIndex-${version}-linux-amd64.tar.gz"
md5sum "PanIndex-"${version}"-linux-amd64.tar.gz"
tar -xvf "PanIndex-"${version}"-linux-amd64.tar.gz"
rm -rf README.md LICENSE
chmod +x PanIndex
/app/PanIndex
