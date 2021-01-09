`ifndef _cpu_vh_
`define _cpu_vh_ 

/* ALU SECTION */

//logical
`include "alu/not32.v"
`include "alu/or32.v"
`include "alu/xor32.v"
`include "alu/and32.v"
`include "alu/and32s.v"

//adder
`include "alu/adder32.v"
`include "alu/adder.v"

//shifter
`include "alu/shifter/mshifter32.v"
`include "alu/shifter/shifter32b1.v"
`include "alu/shifter/shifter32b2.v"
`include "alu/shifter/shifter32b4.v"
`include "alu/shifter/shifter32b8.v"
`include "alu/shifter/shifter32b16.v"

//alu unit
`include "alu/alu.v"
`include "alu/alucont.v"
/* END ALU SECTION */


`include "mux.vh"
`include "decode.v"
`include "pc.v"
`include "mem.v"
`include "dmem-nclk.v"
`include "regfile.v"



//sign extensions
`include "signex/signex12.v"
`include "signex/signex13.v"

//immediate handling
`include "utypeimm.v"
`include "ssignex.v"
`include "isignex.v"

//pc target generation
`include "jumptarggen.v"
`include "branchtarggen.v"

//comparitor
`include "comp.vh"


`endif
