#!/usr/bin/env zsh

touch $CCFS_prefix_DIR/reinstalled.log

package_name=$1

if [[ -z $package_name ]]
then
	echo "error: please select a package to be installed"
	ls ${CCFS_archive_DIR}
	return 1
fi

set -x

setopt ERR_EXIT

pip3 install $package_name --upgrade --no-index --find-links ${CCFS_archive_DIR}/pip

unsetopt ERR_EXIT

set +x

datetime=$(date +'%Y%m%d_%H%M%S')

echo "${datetime}	pip / ${package_name}" >> $CCFS_prefix_DIR/reinstalled.log
