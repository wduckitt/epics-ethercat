#!/bin/env python3
#
#  Script to print the names valid for analogue input generic adc "sample" parameters
#  The names are of the form <pdo_name>.<entry_name>
#   
#   The names are filtered to reflect typical signals only
# 
import diamond_types
import sys

doFilter = True

def usage():
    print(f"""diamond_types_gadc.py: print names valid for ethercat generic adb "sample" parameters
          Usage:
            {__file__} [-a]
            Names returned are filtered to reflect typical ADC signals only
            Options:
                -a  Don't filter for typical ADC signals""")
    
          
    sys.exit(1)

def main():
    devices = diamond_types.getDiamondDeviceSet()
    for typename, revision in sorted(devices.keys()):
        dev = devices[(typename,revision)]
        if doFilter:
            signal_list = dev.getTypicalDeviceSignals()
        else:
            signal_list = dev.getDeviceSignals()
        for signal in signal_list:
            print(f"{signal} : {typename} rev #{revision:08x}")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        if sys.argv[1] == "-a":
            doFilter = False
        if sys.argv[1] == "-h":
            usage()
    main()

