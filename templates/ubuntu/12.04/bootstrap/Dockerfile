FROM ubuntu:12.04 as dev

RUN apt-get update && \
    apt-get install -y \
            autoconf \
            automake \
            build-essential \
            curl \
            git \
            gnupg \
            imagemagick \
            ispell \
            libcanberra-gtk-module \
            libdbus-1-dev \
            libgif-dev \
            libgnutls-dev \
            libgpm-dev \
            libgtk2.0-dev \
            libjpeg-dev \
            libmagick++-dev \
            libncurses-dev \
            libpng-dev \
            libtiff-dev \
            libx11-dev \
            libxpm-dev \
            openssh-client \
            python \
            texinfo \
    && rm -rf /var/lib/apt/lists/*

ENV EMACS_BRANCH="{{BRANCH}}"
ENV EMACS_VERSION="{{VERSION}}"

COPY source /opt/emacs

RUN cd /opt/emacs && \
    ./configure{{CONFIGURE}} && \
    make bootstrap && \
    make && \
    make install

RUN mkdir -p /root/.emacs.d/elpa/gnupg && \
    chmod 700 /root/.emacs.d/elpa/gnupg && \
    gpg -q --homedir /root/.emacs.d/elpa/gnupg -k | grep 81E42C40 || \
    gpg --keyserver hkp://ipv4.pool.sks-keyservers.net --homedir /root/.emacs.d/elpa/gnupg --recv-keys 066DAFCB81E42C40

CMD ["emacs"]

# ------------------------------------------------------------

FROM ubuntu:12.04 as plain

RUN apt-get update && \
    apt-get install -y \
            curl \
            gnupg \
            gpm \
            imagemagick \
            ispell \
            libcanberra-gtk-module \
            libgif4 \
            libgnutls26 \
            libgtk2.0-0 \
            libjpeg8 \
            libmagick++4 \
            libncurses5 \
            libpng12-0 \
            libsm6 \
            libtiff4 \
            libx11-6 \
            libxpm4 \
            openssh-client \
            texinfo \
    && rm -rf /var/lib/apt/lists/*

ENV EMACS_BRANCH="{{BRANCH}}"
ENV EMACS_VERSION="{{VERSION}}"

COPY --from=0 /root/.emacs.d /root/.emacs.d
COPY --from=0 /usr/local /usr/local

CMD ["emacs"]

# ------------------------------------------------------------

FROM plain as ci

RUN apt-get update && \
    apt-get install -y \
	        bash \
			bzip2 \
			git \
			make \
    && rm -rf /var/lib/apt/lists/*

ENV EMACS_BRANCH="{{BRANCH}}"
ENV EMACS_VERSION="{{VERSION}}"

CMD ["emacs"]
