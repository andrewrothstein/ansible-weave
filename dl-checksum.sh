#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/weaveworks/weave/releases/download

dl_ver() {
    local ver=$1
    local url=$MIRROR/$ver/weave
    local lfile=$DIR/weave-$ver
    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "  # %s\n" $url
    printf "  %s: sha256:%s\n" $ver $(sha256sum $lfile | awk '{print $1}')
}

dl_ver ${1:-v2.7.0}
