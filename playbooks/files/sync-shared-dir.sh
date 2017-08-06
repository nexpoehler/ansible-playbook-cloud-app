#!/bin/sh

mkdir -p $2

rsync -a ${1}/ ${2}/


