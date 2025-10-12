#!/bin/bash

# List of ROS2 packages to be installed
PACKAGES=(
  ros-humble-desktop
  ros-humble-pcl-ros
  ros-humble-pcl-conversions
  ros-humble-tf2-sensor-msgs
  ros-humble-tf2-ros
  ros-humble-tf-transformations
  ros-humble-robot-localization
  libboost-all-dev
  python3-opencv
  python3-pip
  python3-rosdep
  python3-colcon-common-extensions
)

echo "Updating and installing packages..."
sudo apt update

for pkg in "${PACKAGES[@]}"; do
  echo "Installing: $pkg"
  sudo apt install -y "$pkg"
done

echo "All the packages were installed.."
