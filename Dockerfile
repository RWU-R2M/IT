FROM ubuntu:22.04
LABEL maintainer="<gokul.edakkepuram@hs.weingarten.de>"

USER root
ENV DEBAIN_FRONTEND=noninteractive

# Set Locale
RUN apt-get update && apt-get install -y locales && \
    locale-gen en_US en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
    export LANG=en_US.UTF-8

# Set Timezone and location
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#Setup sources
RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    lsb-release \
    nano \
    software-properties-common \
    && add-apt-repository universe \
    && curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null \
    && apt-get update && apt upgrade -y

#Install ROS2 Packages
RUN apt-get install ros-humble-desktop-full -y \
    ros-dev-tools

# Source ROS 2
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc