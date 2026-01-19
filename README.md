# ROS 2 Installer & Python Dependencies Setup

This repository contains Bash scripts and configuration files to install ROS 2 and required Python dependencies for your Robotic perception projects.

## 📦 Features

- Installs ROS 2 (specify your distro in the script)
- Installs required Python packages from `requirements.txt`
- Optional: Installs additional ROS 2 packages

## 🚀 Getting Started

### 1. Clone the repository

```
git clone https://github.com/alvaroNavarro/ros2_installer.git
cd ros2_installer
```

### 2. Run the ROS2 installation script
```
sudo chmod +x installer_ros2.sh
./install_ros2.sh
```

### 3. Install ROS2 packages
```
sudo chmod +x install_packages.sh
./install_packages.sh
```

### 4. Install Python dependencies
```
sudo apt install python3-pip
python3 -m pip install --user -r requirements.txt
```

### 5. Create ROS 2 workspace
```
mkdir -p ~/ros2_ws/src
colcon build 
```

### 6. Clone your ROS2 packages into the workspace folder
```
cd ros2_ws/src
git clone ...
cd ..
sudo apt update
rosdep install --from-path src --ignore-src -r -y # Install dependencies 
colcon build --symlink-install --cmake-args=-DCMAKE_BUILD_TYPE=Release --parallel-workers $(nproc)
echo "source ~/ros2_ws/install/local_setup.bash" >> ~/.bashrc
source ~/.bashrc
```




