#!/bin/env python3

#8bconv.py
#converts to 8 bit format
import sys,getopt

def main(argv):
    fname_32b = None 
    fname_8b = None
    try:
        opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
    except getopt.GetoptError:
        print( '8bconv.py -i <inputfile> -o <outputfile>')
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print( '8bconv.py -i <inputfile> -o <outputfile>')
            return
        elif opt in ("-i", "--ifile"):
            fname_32b = arg
        elif opt in ("-o", "--ofile"):
            fname_8b = arg 
    if fname_32b is None: 
        sys.exit("input not provided")
    if fname_8b is None: 
        fname_8b = fname_32b.split(".")[0] + "-8.o"
    h32b = open(fname_32b,'r')
    h8b = open(fname_8b,'w')

    lines = 0

    line = h32b.readline()
    while line != '':
        h8b.writelines(line[6:8] + '\n' +
                line[4:6] + '\n' +
                line[2:4] + '\n' +
                line[0:2] + '\n')
        lines += 4
        line = h32b.readline()

    while lines is not 255:
        h8b.writelines('00\n')
        lines += 1

    h32b.close();
    h8b.close();

if __name__ == "__main__":
       main(sys.argv[1:])



