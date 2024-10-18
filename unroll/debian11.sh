#!/usr/bin/env zsh

if [[ ! $CCFS_compile_OSYS == "debian11" ]]
then
	echo "first load the environment"
fi

ccfs_standard_install.sh openssl-3.2.1
ccfs_standard_install.sh lzip-1.24
ccfs_standard_install.sh bzip2-1.0.8
ccfs_standard_install.sh brotli-1.1.0
ccfs_standard_install.sh curl-7.82.0
ccfs_standard_install.sh sqlite-autoconf-3450100
ccfs_standard_install.sh tcl8.6.13
ccfs_standard_install.sh tk8.6.13
ccfs_standard_install.sh Python-3.12.1
ccfs_standard_install.sh zsh-5.9
ccfs_standard_install.sh git-2.43.0
