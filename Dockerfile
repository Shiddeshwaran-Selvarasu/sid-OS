ARG DOCKER_ARCH=amd64

FROM ${DOCKER_ARCH}/ubuntu:20.04

# apt repo sync
RUN apt update

# 2.2. Host System Requirements
RUN apt install -y bash binutils bison sudo wget gawk software-properties-common nano
RUN DEBIAN_FRONTEND=noninteractive apt install -y coreutils diffutils texinfo sed
RUN apt install -y m4 make patch perl python3 xz-utils findutils grep gzip tar

# Add the PPA for GCC 11 and update repositories again
RUN add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
    apt update && \
    apt install -y gcc-11 g++-11 cpp-11

# Set GCC 11 and G++ 11 as the default
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 100 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 100  && \
    update-alternatives --install /usr/bin/cpp cpp /usr/bin/cpp-11 100

RUN mkdir -p /root/sidos
RUN mkdir -p /ram/lfs

WORKDIR /root/sidos

CMD ["/bin/bash"]