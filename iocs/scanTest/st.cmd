
dbLoadDatabase("dbd/scantest.dbd")
scantest_registerRecordDeviceDriver(pdbbase)



ecAsynInit("/tmp/socket0", 1000000)
dbLoadRecords
dbLoadRecords("../../db/MASTER.template", "DEVICE=HZBBDM:0,PORT=MASTER0,SCAN=I/O Intr")
dbLoadRecords("../../ethercatApp/Db/EK1100.template", "DEVICE=HZBBDM:1,PORT=ERIO.0,SCAN=I/O Intr")
dbLoadRecords("../../ethercatApp/Db/modified/EL1808.template", "DEVICE=HZBBDM:2,PORT=ERIO.1,SCAN=I/O Intr")
dbLoadRecords("../../ethercatApp/Db/modified/EL3255.template", "DEVICE=HZBBDM:3,PORT=POT.0,SCAN=I/O Intr")
dbLoadRecords("../../ethercatApp/Db/modified/EL7342.template", "DEVICE=HZBBDM:4,PORT=DRIVE.1,SCAN=I/O Intr")
dbLoadRecords("../../ethercatApp/Db/EL2872.template", "DEVICE=HZBBDM:5,PORT=ERIO.4,SCAN=I/O Intr")

dbLoadRecords("db/HZB_DC.db", "device=HZB_RF_BUNCHER1_RFM_Trimmer,Pot=HZBBDM:3:INPUT1,MotorDrive=HZBBDM:4,CHANNEL=CHANNEL1,CWLimit=HZBBDM:4:DCMSTATUSCHANNEL1:STATUS__DIGITALINPUT1,CCWLimit=HZBBDM:4:DCMSTATUSCHANNEL1:STATUS__DIGITALINPUT2,Master=HZBBDM:0,EL3255=HZBBDM:3")


##### Load Save files  #####################################################
set_savefile_path("save/")
set_pass0_restoreFile("info_positions.sav")
set_pass1_restoreFile("info_positions.sav")

iocInit()

makeAutosaveFiles()
create_monitor_set("info_positions.req", 1) 

##### Sequencer ###########################################################################################

seq snlDCSequencer, "device=HZB_RF_BUNCHER1_RFM_Trimmer"


