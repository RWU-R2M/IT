# Use multi-arch ROS image
FROM --platform=$TARGETPLATFORM osrf/ros:humble-desktop-full

ARG TARGETPLATFORM
ARG BUILDPLATFORM

RUN apt update -y && \
    apt install -y \
    vim \
    rviz \
    git \
    net-tools \
    inetutils-ping \
    ros-humble-gazebo-ros-pkgs

# Copy local packages to be built
COPY ./src /root/ros2_ws/src

WORKDIR /root/ros2_ws

# Install dependencies and build
RUN /bin/bash -c "source /opt/ros/humble/setup.bash && \
    rosdep install --from-paths src -y --ignore-src && \
    colcon build --packages-select odrive_can"

RUN echo "source /root/ros2_ws/install/setup.bash" >> /root/.bashrc