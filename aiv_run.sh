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

# run and display razor imu uni.
roslaunch razor_imu_9dof razor-pub-and-display.launch

# open the robot configuration from RViz visualizer.
roslaunch wd_aiv_robot aiv_enocoders.launch

# sensor fusion and localization.
roslaunch wd_aiv_robot robot_localization.launch

# start front and laser for the navigation. 
roslaunch aiv_laser_tools aiv_laser_tools_nav.launch

#################### navigation AIV which has lifting part on top of it. #####################
	    ##############  Please comment below robot model 2 ################

# start navigation for robot model 1
roslaunch my_move_base_launcher move_base_launch_3.launch 

     #################### navigation AIV which carry the trolley #####################
	    ##############  Please comment below robot model 2 ################

# start navigation for robot model 2
roslaunch my_move_base_launcher move_base_launch_11.launch 
