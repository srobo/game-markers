#!/bin/bash

# set to 100 to generate the competition markers.
BASE=0
koki_marker_gen=./kokimarker/koki-marker-gen

if [ 1 == 2 ]
then
    echo bees
    for i in `seq 0 27`
    do
        id=$((i + BASE))
        $koki_marker_gen --width 250 --paper-size A3 --desc "ARENA $i" $id arena
    done

    for i in `seq 0 3`
    do
        id=$((i + BASE + 28))
        $koki_marker_gen --width 100 --desc "ROBOT $i" $id robot
    done
fi

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
