#!/bin/sh

BUILD=$1

if [[ -f $BUILD/.nexcess-app.yml ]]; then
    cd $BUILD
    cat $BUILD/.nexcess-app.yml | shyaml get-value hooks.build | bash -x
fi
