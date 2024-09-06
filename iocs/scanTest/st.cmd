
dbLoadDatabase("dbd/scantest.dbd")
scantest_registerRecordDeviceDriver(pdbbase)



ecAsynInit("/tmp/socket0", 1000000)
dbLoadRecords
dbLoadRecords("../../db/MASTER.template", "DEVICE=ECTest:0,PORT=MASTER0,SCAN=I/O Intr")
dbLoadRecords("../../ethercatApp/Db/EK1100.template", "DEVICE=ECTest:1,PORT=ERIO.0,SCAN=I/O Intr")
dbLoadRecords("../../ethercatApp/Db/modified/EL1808.template", "DEVICE=ECTest:1,PORT=ERIO.1,SCAN=I/O Intr")
dbLoadRecords("../../ethercatApp/Db/modified/EL3255.template", "DEVICE=ECTest:1,PORT=POT.0,SCAN=I/O Intr")
dbLoadRecords("../../ethercatApp/Db/modified/EL7342.template", "DEVICE=ECTest:1,PORT=ERIO.3,SCAN=I/O Intr")
dbLoadRecords("../../ethercatApp/Db/EL2872.template", "DEVICE=ECTest:1,PORT=ERIO.4,SCAN=I/O Intr")




#dbLoadRecords("db/test.db", "DEVICE=ECTest:1")
#dbLoadRecords("../../ethercatApp/Db/EL6090.template", "DEVICE=ECTest:2,PORT=ERIO.1,SCAN=I/O Intr")
#dbLoadRecords("../../ethercatApp/Db/sample_app.template", "DEVICE=ECTest:2,PORT=ERIO.1,SCAN=I/O Intr")
#dbLoadRecords("../../db/EL1004.template", "DEVICE=ECTest:2,PORT=VACUUM0,SCAN=I/O Intr")
#dbLoadRecords("../../db/EL3702.template", "DEVICE=ECTest:3,PORT=RF0,SCAN=I/O Intr")
#dbLoadRecords("../../db/EL2004.template", "DEVICE=ECTest:4,PORT=OUT0,SCAN=I/O Intr")
#dbLoadRecords("../../db/gadc.template", "DEVICE=ECTest:3,PORT=RF0,SCAN=.1 second,CHANNEL=1,SAMPLES=100840,INTSCAN=.1 second")
#dbLoadRecords("../../db/xfc.template", "DEVICE=ECTest:3,PORT=RF0,SCAN=.1 second,CHANNEL=1")

iocInit()
