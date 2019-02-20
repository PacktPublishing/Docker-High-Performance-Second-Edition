#!/bin/sh

git init .
dd if=/dev/random of=largefile bs=1024000 count=1000
git add largefile
git commit -m 'insert largefile'
git rm largefile
git commit -m 'drop largefile'
