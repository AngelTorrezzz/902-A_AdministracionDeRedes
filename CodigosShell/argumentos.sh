#!/bin/sh

#echo $#
#echo $0
#echo $*
#echo $@

#reversa=""

for arg in "$@"; do
    reversa="$arg $reversa"
done

echo "$reversa"
