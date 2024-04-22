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

# Add ROS2 apt Repo and Install Development and ROS tools
RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    lsb-release \
    software-properties-common \
    && add-apt-repository universe \
    && curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null \
    && apt-get update && apt-get install -y \
    python3-flake8-docstrings \
    python3-pip \
    python3-pytest-cov \
    ros-dev-tools \
    python3-flake8-blind-except \
    python3-flake8-builtins \
    python3-flake8-class-newline \
    python3-flake8-comprehensions \
    python3-flake8-deprecated \
    python3-flake8-import-order \
    python3-flake8-quotes \
    python3-pytest-repeat \
    python3-pytest-rerunfailures

#Get ROS2 Code
RUN mkdir -p ~/ros2_humble/src \
    && cd ~/ros2_humble \
    && vcs import --input https://raw.githubusercontent.com/ros2/ros2/humble/ros2.repos src

#Install requirements for rosdep
RUN apt-get update && apt-get install --no-install-recommends -y \
    qt5-qmake \
    python3-pytest-timeout

#Install dependencies using rosdep
RUN apt upgrade -y \
    && rosdep init \
    && rosdep fix-permissions \
    && rosdep update \
    && rosdep install --from-paths ~/ros2_humble/src --ignore-src -y --skip-keys "fastcdr rti-connext-dds-6.0.1 urdfdom_headers" 