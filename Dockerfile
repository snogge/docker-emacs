FROM ubuntu:16.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
            autoconf \
            automake \
            build-essential \
            curl \
            git \
            imagemagick \
            ispell \
            libdbus-1-dev \
            libgif-dev \
            libgnutls-dev \
            libgtk2.0-dev \
            libjpeg-dev \
            libmagick++-dev \
            libncurses-dev \
            libpng-dev \
            libtiff-dev \
            libx11-dev \
            libxpm-dev \
            texinfo

# Build emacs
ARG GIT_REPOSITORY="git://git.sv.gnu.org/emacs.git"
ARG GIT_BRANCH
RUN git clone --depth 1 --branch $GIT_BRANCH $GIT_REPOSITORY /tmp/emacs && \
    cd /tmp/emacs && \
    ./autogen.sh && \
    ./configure && \
    make -j 8 install && \
    rm -rf /tmp/emacs

WORKDIR /rootfs
ENTRYPOINT ["emacs"]
