#!/bin/bash

# set to 100 to generate the competition markers.
BASE=0
koki_marker_gen=./kokimarker/koki-marker-gen

for i in `seq 0 7`
do
    id=$((i + BASE + 32))
    $koki_marker_gen --width 160 --desc "SLOT $i" $id slot
done

for i in `seq 0 3`
do
    id=$((i + BASE + 40))
    $koki_marker_gen --width 160 --desc "TOKEN TOP $i" $id token-top
done

for i in `seq 0 3`
do
    id=$((i + BASE + 44))
    $koki_marker_gen --width 160 --desc "TOKEN BOTTOM $i" $id token-bottom
done

for i in `seq 0 3`
do
    id=$((i + BASE + 48))
    $koki_marker_gen --width 160 --desc "TOKEN SIDE $i" $id token-side
done
