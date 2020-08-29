#!/bin/bash
cd public/
rm -r db/
rm -r conf/
mkdir -p /public
cp -rf ./ /public