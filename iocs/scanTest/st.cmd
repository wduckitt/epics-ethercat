#!bin/linux-x86_64/scantest
dbLoadDatabase("dbd/scantest.dbd")
scantest_registerRecordDeviceDriver(pdbbase)

#ADC_Ethercat_Sampler("RF0", 1, "Ch1Sample.Ch1Value", "Ch1CycleCount.Ch1CycleCount")

ecAsynInit("/tmp/socket0", 1000000)

dbLoadRecords("../../db/MASTER.template", "DEVICE=ECTest:0,PORT=MASTER0,SCAN=I/O Intr")
dbLoadRecords("../../ethercatApp/Db/EK1818.template", "DEVICE=ECTest:1,PORT=ERIO.0,SCAN=I/O Intr")
dbLoadRecords("../../ethercatApp/Db/EL6090.template", "DEVICE=ECTest:2,PORT=ERIO.1,SCAN=I/O Intr")
#dbLoadRecords("../../db/EL1004.template", "DEVICE=ECTest:2,PORT=VACUUM0,SCAN=I/O Intr")
#dbLoadRecords("../../db/EL3702.template", "DEVICE=ECTest:3,PORT=RF0,SCAN=I/O Intr")
#dbLoadRecords("../../db/EL2004.template", "DEVICE=ECTest:4,PORT=OUT0,SCAN=I/O Intr")
#dbLoadRecords("../../db/gadc.template", "DEVICE=ECTest:3,PORT=RF0,SCAN=.1 second,CHANNEL=1,SAMPLES=100840,INTSCAN=.1 second")
#dbLoadRecords("../../db/xfc.template", "DEVICE=ECTest:3,PORT=RF0,SCAN=.1 second,CHANNEL=1")

iocInit()
