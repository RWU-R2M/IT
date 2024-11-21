FROM ubuntu:22.04

# Avoid timezone prompt
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

# Install ROS2
RUN apt update -y && \
    apt install -y \
    curl \
    gnupg2 \
    lsb-release && \
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - && \
    sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros2-latest.list' && \
    apt update -y && \
    apt install -y \
    ros-humble-desktop && \
    rm -rf /var/lib/apt/lists/*

RUN apt update -y && \
    apt install -y \
    vim \
    rviz \
    git \
    net-tools \
    inetutils-ping \
    ros-humble-gazebo-ros-pkgs \
    i2c-tools \
    python3-smbus \
    can-utils && \
    rm -rf /var/lib/apt/lists/*