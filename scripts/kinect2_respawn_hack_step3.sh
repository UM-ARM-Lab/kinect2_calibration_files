#!/usr/bin/env bash

roslaunch kinect2_calibration_files kinect2_respawn_hack_step4.launch $@ 2> /tmp/Error
ERROR=$(</tmp/Error)
echo
echo
echo
echo "Errors found while running:"
echo "${ERROR}"

# Check for a failure to launch a nodelet in the error logs
if [[ ${ERROR} = *"Failed to load nodelet"* ]]; then
  exit -1
fi