#!/bin/sh

mkdir -p /tmp/repo
pwd=$(pwd)
cd /tmp/repo
git init -q
git remote add origin ${PLUGIN_REPOSITORY}
sha=$(git rev-parse --short $(git ls-remote origin ${PLUGIN_BRANCH} | cut -f1))
cd $pwd
echo "${PLUGIN_VARIABLE} $sha"
sed -i -e "s/${PLUGIN_VARIABLE} .*\$/${PLUGIN_VARIABLE} $sha/1" ${PLUGIN_FILE}

