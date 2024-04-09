#.devcontainer

## Using the .devcontainer
For the first time, open the folder in VSCode and click on the green button at the bottom right corner of the window. This will build the container and open a new window in the container.

### Building the container
Depending on what you have been working on, you may need to rebuild the applications.
In a new terminal, run the following commands to build the applications:


```bash
cd /workspaces/ethercat-test
make

```

```bash
cd /workspaces/ethercat-test/iocs/scanTest
make

```
Updating the scanner.xml
```bash
cd /workspaces/ethercat-test/iocs/scanTest/etc
../../bin/linux-x86_64/slaveinfo -m 0 > scanner.xml
```



### Starting the scanner
In a new terminal, run the following commands to start the scanner:

```bash
cd /workspaces/ethercat-test/iocs/scanTest
../../bin/linux-x86_64/scanner -m 0 etc/scanner.xml /tmp/socket0

```
### Starting the IOC
In a new terminal, run the following commands to start the IOC:

```bash
cd /workspaces/ethercat-test/iocs/scanTest
./st.cmd

```



#Setting up the environment locally, not using the .devcontainer or docker

## Epics
Pre-requisites Ubuntu 22.04

```bash
sudo apt-get install -y wget autoconf libtool check patch build-essential libreadline-dev re2c libxml2-dev tmux software-properties-common python3-libxml2 python3
```

```
wget https://epics-controls.org/download/base/base-7.0.8.tar.gz
```

## Asyn

```
cd /epics
mkdir support
cd support

wget https://github.com/epics-modules/asyn/archive/refs/tags/R4-44-2.tar.gz
tar -xvf R4-44-2.tar.gz
cd asyn-R4-44-2/
``
edit RELEASE and set epics base

```
EPICS_BASE=/epics/base
```
on ubuntu set TIRPC =YES, edit CONFIG_SITE:
```
TIRPC=YES
```

## Ethercat


EPICS support to read/write to ethercat based hardware

Prerequisites: [IgH EtherCAT Master for Linux](http://etherlab.org/en/ethercat/index.php)

This EPICS module builds with a patched version of etherlab, described in the file etc/makeDocumentation/building.src

The documentation was made when doxygen at DLS would build in the
folder etc/makeDocumentation.

The doxygen documentation is no longer building at Diamond, but the "sources" are in
the folder etc/makeDocumentation.

Release notes in
etc/makeDocumentation/release_notes.src

Please email with issues as the maintainer has been know to ignore
github notifications for months.

Maintainer notes

Before making a release:

1. Check/update the version in ethercatApp/scannerSrc/version.h
2. Write release notes in etc/makeDocumentation/release_notes.src
