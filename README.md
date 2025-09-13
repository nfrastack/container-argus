# nfrastack/container-argus

## About

This will build a container image for [Argus](https://release-argus.io/), An notification manager for updates.

## Maintainer

* [Nfrastack](https://www.nfrastack.com)

## Table of Contents

- [About](#about)
- [Maintainer](#maintainer)
- [Table of Contents](#table-of-contents)
- [Installation](#installation)
  - [Prebuilt Images](#prebuilt-images)
    - [Multi-Architecture Support](#multi-architecture-support)
  - [Quick Start](#quick-start)
  - [Persistent Storage](#persistent-storage)
- [Configuration](#configuration)
  - [Environment Variables](#environment-variables)
    - [Base Images used](#base-images-used)
    - [Core Configuration](#core-configuration)
    - [Argus Options](#argus-options)
- [Users and Groups](#users-and-groups)
  - [Networking](#networking)
- [Maintenance](#maintenance)
  - [Shell Access](#shell-access)
- [Support \& Maintenance](#support--maintenance)
- [License](#license)
- [About](#about-1)

## Installation

### Prebuilt Images

Feature limited builds of the image are available on the [Github Container Registry](https://github.com/nfrastack/container-argus/pkgs/container/container-argus) and [Docker Hub](https://hub.docker.com/r/nfrastack/argus).

To unlock advanced features, one must provide a code to be able to change specific environment variables from defaults. Support the development to gain access to a code.

To get access to the image use your container orchestrator to pull from the following locations:

```
ghcr.io/nfrastack/container-argus:(image_tag)
docker.io/nfrastack/argus:(image_tag)
```

Image tag syntax is:

`<image>:<optional tag>`

Example:

`ghcr.io/nfrastack/container-argus:latest` or

`ghcr.io/nfrastack/container-argus:1.0` or

* `latest` will be the most recent commit
* An otpional `tag` may exist that matches the [CHANGELOG](CHANGELOG.md) - These are the safest
* If there are multiple distribution variations it may include a version - see the registry for availability

Have a look at the container registries and see what tags are available.

#### Multi-Architecture Support

Images are built for `amd64` by default, with optional support for `arm64` and other architectures.

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [compose.yml](examples/compose.yml) that can be modified for your use.

* Map persistent storage for access to configuration and data files for backup.
* Set various environment variables to understand the capabilities of this image.

### Persistent Storage

The following directories are used for configuration and can be mapped for persistent storage.

| Directory | Description |
| --------- | ----------- |
| `/data/`           | Data files                                                 |
| `/logs/`           | Log Files                                                  |
| `/config/`         | Config Files                                               |
| `/www/html/images` | Drop your own images if here if you wish to reference them |

## Configuration

### Environment Variables

#### Base Images used

This image relies on a customized base image in order to work.
Be sure to view the following repositories to understand all the customizable options:

| Image                                                   | Description      |
| ------------------------------------------------------- | ---------------- |
| [OS Base](https://github.com/nfrastack/container-base/) | Base Image       |
| [Nginx](https://github.com/nfrastack/container-nginx/)  | Web Server Image |

Below is the complete list of available options that can be used to customize your installation.

* Variables showing an 'x' under the `Advanced` column can only be set if the containers advanced functionality is enabled.

#### Core Configuration

| Variable                   | Description                                | Default      |
| -------------------------- | ------------------------------------------ | ------------ |
| `CONFIG_FILE`              | Configuration File                         | `argus.yaml` |
| `CONFIG_PATH`              | Path for configuration files               | `/config/`   |
| `DATA_FILE`                | Database file name                         | `argus.db`   |
| `DATA_PATH`                | Database files                             | `/data/`     |
| `LISTEN_IP`                | Listening IP                               | `0.0.0.0`    |
| `LISTEN_PORT`              | Listening Port of Argus                    | `8080`       |
| `LISTEN_PREFIX`            | Root URL                                   | `/`          |
| `LOG_FILE`                 | Log Name                                   | `argus.log`  |
| `LOG_PATH`                 | Logfile location                           | `/logs/`     |
| `LOG_TYPE`                 | `CONSOLE` `FILE` `BOTH`                    | `CONSOLE`    |
| `SETUP_TYPE`               | `AUTO` `MANUAL`                            | `AUTO`       |
| `RESTART_ON_CONFIG_CHANGE` | Restart Argus on configuration file change | `TRUE`       |


#### Argus Options

| Variable                                       | Description                                                       | Default | `_FILE` |
| ---------------------------------------------- | ----------------------------------------------------------------- | ------- | ------- |
| `ARGUS_ARGS`                                   | Arguments to pass to Argus process upon starting                  | ``      | x       |
| `ADMIN_PASS`                                   | (optional) Admin Password                                         | `null`  | x       |
| `ADMIN_USER`                                   | (optional Admin User                                              | `null`  | x       |
| `DEFAULT_SERVICE_CHECK_INTERVAL`               | If exist set default service check interval                       |         |         |
| `DEFAULT_SERVICE_LATEST_VERSION_ACCESS_TOKEN ` | If exist set default service latest release access token (github) |         | x       |
| `LOG_LEVEL`                                    | `DEBUG` `VERBOSE` `INFO` `WARNING` `ERROR`                        | `INFO`  |         |


## Users and Groups

| Type  | Name  | ID   |
| ----- | ----- | ---- |
| User  | `argus` | 10000 |
| Group | `argus` | 10000 |

### Networking

| Port | Protocol | Description |
| ---- | -------- | ----------- |
| `8080` | `tcp` | Release Argus Listening Port
* * *

## Maintenance

### Shell Access

For debugging and maintenance, `bash` and `sh` are available in the container.


## Support & Maintenance

* For community help, tips, and community discussions, visit the Discussions board.
* For personalized support or a support agreement, see Nfrastack Support.
* To report bugs, submit a Bug Report. Usage questions will be closed as not-a-bug.
* Feature requests are welcome, but not guaranteed. For prioritized development, consider a support agreement.
* Updates are best-effort, with priority given to active production use and support agreements.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
