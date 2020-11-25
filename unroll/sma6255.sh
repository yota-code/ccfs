#!/usr/bin/env zsh

source ../export_path /C/autools/root/platform/redhat-7.2_corei7_2020.10

ccfs_standard_install.sh lzip-1.21
ccfs_standard_install.sh xz-5.2.5
ccfs_standard_install.sh bzip2-1.0.8
ccfs_standard_install.sh brotli-1.0.9

ccfs_standard_install.sh libtool-2.4.6
ccfs_standard_install.sh libunistring-0.9.10
ccfs_standard_install.sh gc-8.0.4 # garbage collector, required by ?

ccfs_standard_install.sh gmp-6.2.0
ccfs_standard_install.sh mpfr-4.1.0
ccfs_standard_install.sh mpc-1.1.0
ccfs_standard_install.sh libffi-3.3 # required by guile

ccfs_standard_install.sh guile-2.0.14 # required by autoconf, only this version 2.0.x works

ccfs_standard_install.sh autogen-5.18.7
ccfs_standard_install.sh autoconf-2.69

ccfs_standard_install.sh zeromq-4.3.2
ccfs_standard_install.sh sqlite-autoconf-3330000
ccfs_standard_install.sh openssl-1.1.1h
ccfs_standard_install.sh curl-7.68.0

ccfs_standard_install.sh Python-3.8.6

ccfs_standard_install.sh qpdf-8.4.2 # v10 branch can not be compiled on this old gcc, v9 not tested
ccfs_standard_install.sh git-2.28.0
ccfs_standard_install.sh zsh-5.8

rehash