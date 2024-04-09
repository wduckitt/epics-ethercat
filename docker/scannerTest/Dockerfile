
FROM epicsethercatbase
WORKDIR /epics/epics-ethercat/iocs/scanTest
RUN make
CMD tmux new-session -s ioc -d ./st.cmd && tmux attach -t ioc


