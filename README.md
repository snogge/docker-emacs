# Description

Run Emacs in docker containers!

This project provides different docker images:

- The main images (~500MB) only contain the runtime dependencies for Emacs to run.
- The `-dev` variants (~1400MB) also contain the build dependencies, the Emacs source (in `/opt/emacs`), and additional
  tools such as [Cask](https://cask.readthedocs.io), [git](https://git-scm.com) and [Python](https://www.python.org).
- The `-alpine` variants (~200MB) follow the same logic as the main images but are based on
  [Alpine Linux](https://alpinelinux.org).
- The `-ci` and `-alpine-ci` variants are based on the main and
  `'alpine' images respectively.  They add some basic tools to make CI
  easier, e.g. bash, bzip2, git, make, and tar.

# Tags

- [`master-alpine-ci`](https://github.com/snogge/docker-emacs/blob/master/master/alpine/3.9/Dockerfile)
- [`27.0-alpine-ci`, `27-alpine-ci`](https://github.com/snogge/docker-emacs/blob/master/27.0/alpine/3.9/Dockerfile)
- [`26.3-alpine-ci`, `26-alpine-ci`, `alpine-ci`](https://github.com/snogge/docker-emacs/blob/master/26.3/alpine/3.9/Dockerfile)
- [`26.2-alpine-ci`](https://github.com/snogge/docker-emacs/blob/master/26.2/alpine/3.9/Dockerfile)
- [`26.1-alpine-ci`](https://github.com/snogge/docker-emacs/blob/master/26.1/alpine/3.9/Dockerfile)
- [`25.3-alpine-ci`, `25-alpine-ci`](https://github.com/snogge/docker-emacs/blob/master/25.3/alpine/3.9/Dockerfile)
- [`25.2-alpine-ci`](https://github.com/snogge/docker-emacs/blob/master/25.2/alpine/3.9/Dockerfile)
- [`25.1-ci`](https://github.com/snogge/docker-emacs/blob/master/25.1/ubuntu/18.04/Dockerfile)
- [`24.5-ci`, `24-ci`](https://github.com/snogge/docker-emacs/blob/master/24.5/ubuntu/18.04/Dockerfile)
- [`24.4-ci`](https://github.com/snogge/docker-emacs/blob/master/24.4/ubuntu/12.04/Dockerfile)
- [`24.3-ci`](https://github.com/snogge/docker-emacs/blob/master/24.3/ubuntu/12.04/Dockerfile)
- [`24.2-ci`](https://github.com/snogge/docker-emacs/blob/master/24.2/ubuntu/12.04/Dockerfile)
- [`24.1-ci`](https://github.com/snogge/docker-emacs/blob/master/24.1/ubuntu/12.04/Dockerfile)
- [`23.4-ci`, `23-ci`](https://github.com/snogge/docker-emacs/blob/master/23.4/ubuntu/12.04/bootstrap/Dockerfile)

# Usage

## Console

``` shell
docker run -it --rm olanilsson/emacs
```

## GUI

``` shell
xhost +local:root # WARN: this comes with security issues
docker run -it --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix olanilsson/emacs
```

# Alternatives

- [flycheck/emacs-cask](https://hub.docker.com/r/flycheck/emacs-cask): collection of docker images containing a
  minimal Emacs compiled from source with Cask.
- [flycheck/emacs-travis](https://github.com/flycheck/emacs-travis): makefile which provides targets to
  install Emacs stable and emacs-snapshot, Texinfo and Cask.
- [jgkamat/airy-docker-emacs](https://github.com/jgkamat/airy-docker-emacs): alpine-based docker images that have
  Emacs installed through the package manager.
- [JAremko/docker-emacs](https://github.com/JAremko/docker-emacs): collection of docker images with focus on GUI usage.
- [rejeep/evm](https://github.com/rejeep/evm): pre-built Emacs binaries.

# Contributions

They are very welcome! The basic workflow is as follow:

- Modify `images.yml`.
- Modify files inside the `/templates` directory.
- Run `bin/images generate` to spread the changes everywhere.
