#!/bin/bash

BASE=0

for i in `seq 0 3`
do
    id=$((i + 32))
    ./koki-marker-gen --width 160 --desc "SLOT $i" $id slot
done

for i in `seq 0 3`
do
    id=$((i + 40))
    ./koki-marker-gen --width 160 --desc "TOKEN TOP $i" $id token-top
done

for i in `seq 0 3`
do
    id=$((i + 44))
    ./koki-marker-gen --width 160 --desc "TOKEN BOTTOM $i" $id token-bottom
done

for i in `seq 0 3`
do
    id=$((i + 48))
    ./koki-marker-gen --width 160 --desc "TOKEN SIDE $i" $id token-side
done
