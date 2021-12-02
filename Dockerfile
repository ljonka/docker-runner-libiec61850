FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y cmake libgtest-dev libboost-test-dev g++ build-essential python-dev autotools-dev && rm -rf /var/lib/apt/lists/* 


# https://github.com/mz-automation/libiec61850

RUN apt-get update && \
    apt-get install -y git-core && \
    git clone https://github.com/mz-automation/libiec61850.git /libiec61850 && \
    cd /libiec61850 && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make INSTALL_PREFIX=/usr/local install && \
    rm -rf /var/lib/apt/lists/*
