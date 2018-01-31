#!/usr/bin/env bash

# Assumes exactly 3 arguments, if that ever changes this and "kinect2_bridge_respawner.launch" must change in sync

# roslaunch returns the same value regardless of the exit code of each node,
# so for now just rely on a spammed Ctrl+C to close this script
cd "$(dirname "$0")"
until ./kinect2_respawn_hack_step3.sh ${1} ${2} ${3}; do
    echo "rerun_helper.sh exited with code $?. Respawning.." >&2
    sleep 1
done

echo "Final rerun_helper.sh output code $?." >&2
