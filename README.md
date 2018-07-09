# Description

Run Emacs in a docker!

This project provides different docker images:

- The main images (~500MB) only contain the runtime dependencies for Emacs to run.
- The `-dev` variants (~1400MB) contain additional developer tools such as [Cask](https://cask.readthedocs.io),
  [git](https://git-scm.com) or [Python](https://www.python.org).  The Emacs source is also available at `/opt/emacs` if
  you need to build Emacs differently.
- The `-alpine` variants (~200MB) follow the same logic as the main images but are based on
  [Alpine Linux](https://alpinelinux.org).

# Tags

- `master-alpine-ci` [(master/alpine/3.7/Dockerfile)](https://github.com/snogge/docker-emacs/blob/master/master/alpine/3.7/Dockerfile)
- `26.1-alpine-ci`, `26-alpine-ci`, `alpine-ci` [(26.1/alpine/3.7/Dockerfile)](https://github.com/snogge/docker-emacs/blob/master/26.1/alpine/3.7/Dockerfile)
- `25.3-alpine-ci`, `25-alpine-ci` [(25.3/alpine/3.7/Dockerfile)](https://github.com/snogge/docker-emacs/blob/master/25.3/alpine/3.7/Dockerfile)
- `25.2-alpine-ci` [(25.2/alpine/3.7/Dockerfile)](https://github.com/snogge/docker-emacs/blob/master/25.2/alpine/3.7/Dockerfile)
- `25.1-dev` [(25.1/ubuntu/18.04/Dockerfile)](https://github.com/snogge/docker-emacs/blob/master/25.1/ubuntu/18.04/Dockerfile)
- `24.5-dev`, `24-dev` [(24.5/ubuntu/18.04/Dockerfile)](https://github.com/snogge/docker-emacs/blob/master/24.5/ubuntu/18.04/Dockerfile)
- `24.4-dev` [(24.4/ubuntu/12.04/Dockerfile)](https://github.com/snogge/docker-emacs/blob/master/24.4/ubuntu/12.04/Dockerfile)
- `24.3-dev` [(24.3/ubuntu/12.04/Dockerfile)](https://github.com/snogge/docker-emacs/blob/master/24.3/ubuntu/12.04/Dockerfile)
- `23.4-dev`, `23-dev` [(23.4/ubuntu/12.04/bootstrap/Dockerfile)](https://github.com/snogge/docker-emacs/blob/master/23.4/ubuntu/12.04/bootstrap/Dockerfile)

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

- [flycheck/emacs-cask](https://hub.docker.com/r/flycheck/emacs-cask) is a collection of Docker images containing a
  minimal Emacs compiled from source with Cask.
- [flycheck/emacs-travis](https://github.com/flycheck/emacs-travis) contains a makefile which provides targets to
  install Emacs stable and emacs-snapshot, Texinfo and Cask.
- [jgkamat/airy-docker-emacs](https://github.com/jgkamat/airy-docker-emacs) are alpine-based docker images that have
  Emacs installed through the package manager.
- [rejeep/evm](https://github.com/rejeep/evm) provides pre-built Emacs binaries.

# Contributions

They are very welcome! The basic workflow is as follow:

- Modify `images.yml`.
- Modify files inside the `/templates` directory.
- Run `bin/images generate` to spread the changes everywhere.
