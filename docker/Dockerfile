FROM arm64v8/ros:humble

# Avoid timezone prompt
#ENV DEBIAN_FRONTEND=noninteractive
#ENV TZ=Etc/UTC

# Install additional packages
RUN apt update -y && \
    apt install -y \
    vim \
    git \
    net-tools \
    inetutils-ping \
    i2c-tools \
    python3-smbus \
    can-utils \
    qtbase5-dev \
    qt5-qmake \
    qtbase5-dev-tools && \
    rm -rf /var/lib/apt/lists/*

# Copy local packages to be built
COPY ./src /root/ros2_ws/src

WORKDIR /root/ros2_ws

# Install dependencies and build
RUN /bin/bash -c "source /opt/ros/humble/setup.bash"
RUN /bin/bash -c "colcon build --packages-select odrive_can"

# Source ROS in bashrc
RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc && \
    echo "source /root/ros2_ws/install/setup.bash" >> /root/.bashrc

CMD ["bash"]