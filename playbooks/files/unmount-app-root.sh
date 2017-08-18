#!/bin/sh

MOUNT=$1

function do_unmount {
    local m=$1
    umount $m
    while mountpoint $m; do
	fuser -k $m
	umount $m
	sleep 1
    done
}

for m in $(findmnt -nl | grep ${MOUNT}/ | awk '{print $1}'); do

    do_unmount $m

done

do_unmount $MOUNT
