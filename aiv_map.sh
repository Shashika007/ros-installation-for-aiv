#!/bin/bash

sudo chmod a+rw /dev/ttyUSB0
sudo chmod a+rw /dev/ttyACM0
sudo chmod a+rw /dev/ttyACM1
sudo chmod a+rw /dev/ttyACM2
sudo chmod a+rw /dev/ttyACM2

# start Master. 
roscore

# run rosserial to connect arduino.
rosrun rosserial_python serial_node.py _baud:=115200 _port:=/dev/ttyACM2

# run teleop keyboard
rosrun teleop_twist_keyboard teleop_twist_keyboard.py 

# run and display razor imu uni.
roslaunch razor_imu_9dof razor-pub-and-display.launch

# open the robot configuration from RViz visualizer.
roslaunch wd_aiv_robot aiv_enocoders_map.launch

# sensor fusion and localization.
roslaunch wd_aiv_robot robot_localization.launch

# start front and laser for the navigation (dual laser mapping). 
roslaunch aiv_laser_tools aiv_laser_tools.launch

# start gmapping.
roslaunch my_mapping_launcher my_gmapping_launch.launch 

