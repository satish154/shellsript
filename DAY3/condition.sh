#!/bin/bash
NUM=$1
if [ $NUM -lt 10 ]; then
    echo "given $NUM is less than 10"
else
    echo " given $NUM is greater than or eq to 10"
fi
# -gt
# -lt
# -ne