
FROM ubuntu:22.04 as epicsethercatbase
ENV EPICS_BASE=/epics/base/
WORKDIR /epics

RUN apt-get update && apt-get install -y iproute2 wget autoconf libtool check patch build-essential libreadline-dev re2c libxml2-dev tmux software-properties-common python3-libxml2 python3
RUN wget https://epics-controls.org/download/base/base-7.0.8.tar.gz
RUN tar -xvf base-7.0.8.tar.gz
RUN ln -s /epics/base-7.0.8 /epics/base
WORKDIR /epics/base
RUN make -j 4
WORKDIR /epics
RUN mkdir support
WORKDIR /epics/support
RUN wget https://github.com/epics-modules/asyn/archive/refs/tags/R4-44-2.tar.gz
RUN tar -xvf R4-44-2.tar.gz
WORKDIR /epics/support/asyn-R4-44-2
ADD /data /data
RUN cp /data/epics/configs/asyn-R4-44-2/configure/CONFIG_SITE /epics/support/asyn-R4-44-2/configure/CONFIG_SITE
RUN cp /data/epics/configs/asyn-R4-44-2/configure/RELEASE /epics/support/asyn-R4-44-2/configure/RELEASE

RUN make -j 4

RUN apt-get update && apt-get install -y libtool libcap-dev make autoconf automake udev gcc-12 pkg-config linux-headers-$(uname -r) kmod
RUN echo KERNEL==\"EtherCAT[0-9]*\", MODE=\"0664\" > /etc/udev/rules.d/99-EtherCAT.rules

WORKDIR /etherlab
RUN wget https://gitlab.com/etherlab.org/ethercat/-/archive/master/ethercat-master.tar.gz
RUN tar -xvf ethercat-master.tar.gz
RUN ln -s /etherlab/ethercat-master /etherlab/ethercat
WORKDIR /etherlab/ethercat
RUN ./bootstrap
RUN ./configure --enable-generic
RUN make
RUN make install
RUN make modules
RUN make modules_install
RUN cp /data/usr/local/etc/ethercat.conf /usr/local/etc/ethercat.conf
RUN depmod -a
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib 
WORKDIR /epics
RUN echo 1 && wget https://github.com/wduckitt/epics-ethercat/archive/refs/heads/updateToLatest.tar.gz
RUN tar -xvf updateToLatest.tar.gz
RUN mv epics-ethercat-updateToLatest epics-ethercat
WORKDIR /epics/epics-ethercat
RUN make
# WORKDIR /epics/epics-ethercat/iocs/scanTest
# RUN make



