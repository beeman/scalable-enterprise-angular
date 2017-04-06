#!/bin/bash
set -e

npm run clean
npm install

# Hack - symlink angular to CLI projects to work around CLI bug:
# https://github.com/angular/angular-cli/issues/3864

# Wworks on OSX and Linux - probably not on Windows.
PWD=$(pwd)
find node_modules -maxdepth 1 | while read fname; do
  for appname in admin agent portal ; do
    ln -s $PWD/$fname application/$appname/$fname
  done
done

npm run both

echo "success"
