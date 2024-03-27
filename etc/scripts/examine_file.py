#!/bin/env python3
#
# script to list ethercat device types available in one file

import os, sys

# import ethercat.py from this module's builder
scripts_dir = os.path.dirname(os.path.abspath(__file__))
etc_dir = os.path.realpath(os.path.join(scripts_dir,'../'))
builder_dir = os.path.realpath(os.path.join(etc_dir, 'builder'))

if builder_dir not in sys.path:
    sys.path.insert(0, builder_dir)

import ethercat

def usage():

    print(f"""examine_file.py: print device descriptions in file
          Usage:
            {__file__} [-a] file.xml [ file2.xml file3.xml ... ]
            Names returned are filtered to reflect only devices supported at DLS
            Options:
                -a  Shows all devices, does not filter for DLS supported devices
            Example:
                {__file__} ../xml/NI9144.xml
""")
    
    sys.exit(1)

doFilter = True

def keyRepr(key):
    ( typename, revision ) = key
    return "%s %d" % (typename, revision)

if __name__ == "__main__":
    if len(sys.argv) >= 2:
        if sys.argv[1] == "-a":
            sys.argv.pop(1)
            doFilter = False
        if sys.argv[1] == "-h":
            usage()
    else:
        usage()
    ethercat.initialise()
    while len(sys.argv) > 1:
        print("processing %s" % sys.argv[1])
        dev_set = ethercat.getDescriptions(sys.argv[1])
        # filtered set
        fset = dev_set
        if dev_set and doFilter:
            fset = ethercat.filteredDescriptions(dev_set)
        if fset:
            print(f"""File: {sys.argv[1]}
                  Number of entries: {len(fset)} (Filter: {doFilter})
""")
            for k in sorted(fset.keys(), key=keyRepr):
                print(f"{k[0]} rev 0x{k[1]:08x}")
        else:
            print("File: %(name)s has no descriptions" % dict(
                name = sys.argv[1]))
        sys.argv.pop(1)

