#!/bin/bash

apt-get update
apt-get upgrade
apt update --fix-missing

apt-get install ros-$ROS_DISTRO-turtlesim -y
apt-get install ros-$ROS_DISTRO-rqt ros-$ROS_DISTRO-rqt-common-plugins -y
# apt-get install ros-$ROS_DISTRO-gazebo-ros-pkgs -y
apt-get install ros-$ROS_DISTRO-rviz2 -y

#Cartographer
apt install ros-$ROS_DISTRO-cartographer -y
apt install ros-$ROS_DISTRO-cartographer-ros -y

#rosdep
rosdep init
rosdep update
. /opt/ros/$ROS_DISTRO/setup.sh
apt-get install python3-rosdep -y
echo '151.101.84.133 raw.githubusercontent.com' | tee -a /etc/hosts
cat /etc/hosts
rosdep init
rosdep update