#!/bin/sh

echo "Get Git commit id for branch ${PLUGIN_BRANCH} of ${PLUGIN_REPOSITORY}"

mkdir -p /tmp/repo
pwd=$(pwd)
cd /tmp/repo
git init -q
git remote add origin ${PLUGIN_REPOSITORY}
SHA=$(git rev-parse --short $(git ls-remote origin ${PLUGIN_BRANCH} | cut -f1))

cd $pwd/eve

grep -H -o -r "${PLUGIN_VARIABLE} [0-9a-fA-F]*$" * | while read LINE
do
	FILE=`echo $LINE | cut -d":" -f1`
	OLD=`echo $LINE | cut -d" " -f2`

	echo "${FILE} : ${PLUGIN_VARIABLE} : ${OLD} -> ${SHA}"
	sed -i -e "s/${PLUGIN_VARIABLE} [0-9a-fA-F]*\$/${PLUGIN_VARIABLE} ${SHA}/1" ${FILE}

done
