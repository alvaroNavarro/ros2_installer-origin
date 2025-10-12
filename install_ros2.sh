#!/bin/bash

set -e  # Stop whether error happens

echo "----------------------------------------------"
echo "Installing ROS2 Humble in Ubuntu 22.04" 
echo "----------------------------------------------"

# 1. locale settings
sudo apt update && sudo apt install -y locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

# 2. Add respository of ROS 2
sudo apt install -y software-properties-common
sudo add-apt-repository universe

# 3. Add the repository of GPG key ROS 2 
sudo apt update && sudo apt install -y curl
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo tee /etc/apt/trusted.gpg.d/ros.asc > /dev/null

# 4. Add ROS2 repositoris to the source list
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/ros.asc] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo "$UBUNTU_CODENAME") main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# 5. Install ROS Distro full
sudo apt-get install ros-humble-desktop

# 7. rosdep initialization
sudo rosdep init || true
rosdep update

# 8. add to the bashrc file
if ! grep -q "source /opt/ros/humble/setup.bash" ~/.bashrc; then
  echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
fi

# 9. manual source for this session
source /opt/ros/humble/setup.bash

echo "ROS Humble is already installed."
echo ""
