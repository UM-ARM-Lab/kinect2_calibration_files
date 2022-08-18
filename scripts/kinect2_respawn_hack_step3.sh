#!/usr/bin/env bash

roslaunch kinect2_calibration_files kinect2_respawn_hack_step4.launch $@ 2> ~/kinect2_errors.log
chmod 666 ~/kinect2_errors.log
ERROR=$(<~/kinect2_errors.log)
echo
echo
echo
echo "Errors found while running:"
echo "${ERROR}"

# Check for a failure to launch a nodelet in the error logs
if [[ ${ERROR} = *"Failed to load nodelet"* ]]; then
  exit -1
fi
