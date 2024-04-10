
FROM epicsethercatbase
ADD iocs /epics/ethercat/iocs
WORKDIR /epics/ethercat/iocs/scanTest
RUN make

CMD tmux new-session -s ioc -d 'make && ./st.cmd' 


