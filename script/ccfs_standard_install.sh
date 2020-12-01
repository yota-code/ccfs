#!/usr/bin/env zsh

datetime=$(date +'%Y%m%d_%H%M%S')

_ccfs_standard_install.sh $1 2>&1 | tee "$CCFS_log_DIR/${datetime}_$1.log"
