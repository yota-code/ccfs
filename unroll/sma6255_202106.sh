#!/usr/bin/env zsh

source ../install_path

ccfs_standard_install.sh tar-1.34 # 20210213

ccfs_standard_install.sh lzip-1.22 # 20210109
ccfs_standard_install.sh gzip-1.10 # 20181230
ccfs_standard_install.sh xz-5.2.5 # 20200317
ccfs_standard_install.sh bzip2-1.0.8 # 20190713
ccfs_standard_install.sh brotli-1.0.9 # 20200827

ccfs_standard_install.sh libtool-2.4.6 # 20150215
ccfs_standard_install.sh libunistring-0.9.10 # 20180525
ccfs_standard_install.sh gc-8.0.4 # 20190401

ccfs_standard_install.sh gmp-6.2.1 # 20201114
ccfs_standard_install.sh mpfr-4.1.0 # 20200710
ccfs_standard_install.sh mpc-1.2.1 # 20201023
ccfs_standard_install.sh libffi-3.4.2 # 20210628 required by guile

ccfs_standard_install.sh guile-2.0.14 # 20170213 required by autoconf, only this version 2.0.x works

ccfs_standard_install.sh autogen-5.18.7
ccfs_standard_install.sh autoconf-2.69

ccfs_standard_install.sh sqlite-autoconf-3360000
ccfs_standard_install.sh tcl8.6.11
ccfs_standard_install.sh tk8.6.11

ccfs_standard_install.sh libsodium-1.0.17
ccfs_standard_install.sh zeromq-4.1.4

ccfs_standard_install.sh openssl-1.1.1k
ccfs_standard_install.sh curl-7.77.0

ccfs_standard_install.sh Python-3.9.6

ccfs_standard_install.sh qpdf-8.4.2 # v10 branch can not be compiled on this old gcc, v9 not tested
ccfs_standard_install.sh git-2.32.0
ccfs_standard_install.sh zsh-5.8 # 20200215

rehash
