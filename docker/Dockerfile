FROM ros:humble-desktop-full

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

# Copy local packages to be built
COPY ./src /root/ros2_ws/src

WORKDIR /root/ros2_ws

# Install dependencies and build
RUN /bin/bash -c "source /opt/ros/humble/setup.bash && \
    rosdep install --from-paths src -y --ignore-src && \
    colcon build --packages-select odrive_can"

# Setup ROS environment
RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc && \
    echo "source /root/ros2_ws/install/setup.bash" >> /root/.bashrc

# Set environment variables for hardware access
ENV UDEV=1
ENV DISPLAY=:0

CMD ["bash"]