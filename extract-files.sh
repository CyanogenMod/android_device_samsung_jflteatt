#!/bin/sh

set -e

export DEVICE=jflteatt
export VENDOR=samsung
./../jf-common/extract-files.sh $@
