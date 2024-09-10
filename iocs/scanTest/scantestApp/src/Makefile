TOP=../..

include $(TOP)/configure/CONFIG

# IOC

DBD += scantest.dbd 
# scantest_DBD += base.dbd ecAsyn.dbd 
scantest_DBD +=base.dbd ecAsyn.dbd asSupport.dbd 

PROD_IOC = scantest
scantest_SRCS += scantest_registerRecordDeviceDriver.cpp

# These two lines are needed for non-vxWorks builds, such as Linux
scantest_SRCS_DEFAULT += scantestMain.cpp
scantest_SRCS_vxWorks += -nil-

# Add locally compiled object code
# scantest_SRCS +=

# The following adds object code from base/src/vxWorks
scantest_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

scantest_LIBS += ecAsyn asyn autosave scannerlib rtutils
scantest_LIBS += seq pv

########################
# snlStepperMotorSequencer_SNCFLAGS += +r
	snlDCSequencer_SNCFLAGS += +r #added
# snlPistonSequencer_SNCFLAGS += +r #added
# scantest_DBD += snlStepperMotorSequencer.dbd
	scantest_DBD += snlDCSequencer.dbd #added
# scantest_DBD += snlPistonSequencer.dbd #added
# scantest_SRCS += snlStepperMotorSequencer.stt
	scantest_SRCS += snlDCSequencer.stt #added
# scantest_SRCS += snlPistonSequencer.stt #added
    #scantest_LIBS += seq pv 
    
    # # Build sncProgram as a standalone program
    # PROD_HOST += snlStepperMotorSequencerProgram
    # snlStepperMotorSequencerProgram_SNCFLAGS += +m
    # snlStepperMotorSequencerProgram_SRCS += snlStepperMotorSequencerProgram.st
    # snlStepperMotorSequencerProgram_LIBS += seq pv
    # snlStepperMotorSequencerProgram_LIBS += $(EPICS_BASE_HOST_LIBS)

    # # # Build sncProgram as a standalone program
    # PROD_HOST += snlDCSequencerProgram
    # snlDCSequencerProgram_SNCFLAGS += +m
    # snlDCSequencerProgram_SRCS += snlDCSequencerProgram.st
    # snlDCSequencerProgram_LIBS += seq pv
    # snlDCSequencerProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
	
	# # # Build sncProgram as a standalone program
    # PROD_HOST += snlPistonSequencerProgram
    # snlPistonSequencerProgram_SNCFLAGS += +m
    # snlPistonSequencerProgram_SRCS += snlPistonSequencerProgram.st
    # snlPistonSequencerProgram_LIBS += seq pv
    # snlPistonSequencerProgram_LIBS += $(EPICS_BASE_HOST_LIBS)


########################


scantest_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
