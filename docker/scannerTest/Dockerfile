
FROM epicsethercatbase
ADD iocs /epics/ethercat/iocs
WORKDIR /epics/ethercat/iocs/scanTest
RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/epics/ethercat/lib/linux-$(uname -m)
RUN make

CMD tmux new-session -s ioc -d './start_ioc.sh' 


