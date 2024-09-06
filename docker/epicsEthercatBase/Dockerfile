
FROM debian:bookworm as epicsethercatbase
ENV EPICS_BASE=/epics/base/
WORKDIR /epics
RUN apt-get update && apt-get install -y iproute2 wget autoconf libtool check patch build-essential libreadline-dev re2c libxml2-dev tmux software-properties-common python3-libxml2 python3 htop libtool libcap-dev make autoconf automake udev gcc-12 pkg-config linux-headers-$(uname -r) kmod
RUN wget https://epics-controls.org/download/base/base-7.0.8.tar.gz
RUN tar -xvf base-7.0.8.tar.gz
RUN ln -s /epics/base-7.0.8 /epics/base
WORKDIR /epics/base
RUN make -j 4
ADD /data /data
RUN cp /data/epics/dbd/menuScan.dbd /epics/base/dbd/menuScan.dbd
WORKDIR /epics
RUN mkdir support
WORKDIR /epics/support
RUN wget https://github.com/epics-modules/asyn/archive/refs/tags/R4-44-2.tar.gz
RUN tar -xvf R4-44-2.tar.gz
WORKDIR /epics/support/asyn-R4-44-2

RUN cp /data/epics/configs/asyn-R4-44-2/configure/CONFIG_SITE /epics/support/asyn-R4-44-2/configure/CONFIG_SITE
RUN cp /data/epics/configs/asyn-R4-44-2/configure/RELEASE /epics/support/asyn-R4-44-2/configure/RELEASE

RUN make -j 4

# RUN apt-get update && apt-get install -y libtool libcap-dev make autoconf automake udev gcc-12 pkg-config linux-headers-$(uname -r) kmod
RUN echo KERNEL==\"EtherCAT[0-9]*\", MODE=\"0664\" > /etc/udev/rules.d/99-EtherCAT.rules

WORKDIR /etherlab
RUN wget https://gitlab.com/etherlab.org/ethercat/-/archive/1.6.0/ethercat-1.6.0.tar.gz
RUN tar -xvf ethercat-1.6.0.tar.gz
RUN ln -s /etherlab/ethercat-1.6.0 /etherlab/ethercat
WORKDIR /etherlab/ethercat
RUN ./bootstrap
RUN ./configure --enable-generic --enable-eoe 
RUN make
RUN make install
RUN make modules
RUN make modules_install
RUN cp /data/usr/local/etc/ethercat.conf /usr/local/etc/ethercat.conf
RUN depmod -a
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib 
WORKDIR /
ADD configure /epics/ethercat/configure
ADD etc /epics/ethercat/etc
ADD ethercatApp /epics/ethercat/ethercatApp
ADD Makefile /epics/ethercat/Makefile
WORKDIR /epics/ethercat
RUN make
ADD iocs /epics/ethercat/iocs
RUN mkdir -p /tmuxtmp
ENV TMUX_TMPDIR=/tmuxtmp
ADD /entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
    && echo "$SNIPPET" >> "/root/.bashrc"

# Set the entrypoint this setups the ARCH variable


ENTRYPOINT ["/entrypoint.sh"]
CMD [ "sleep", "infinity" ]




