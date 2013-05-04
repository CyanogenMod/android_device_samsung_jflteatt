#!/bin/sh

set -e

export DEVICE=jfltecan
export VENDOR=samsung
./../jf-common/extract-files.sh $@
