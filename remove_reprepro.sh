#!/bin/bash
cd /aptly/public/
rm -r db/
rm -r conf/
mkdir -p /public
cp -rf ./ /public
mkdir -p $WORKDIR_SH23/public
cp -rf $WORKDIR_SH23/public/