#
# Template: A very simple ModelSim Do-File
#           (prepared for "schematic entry" FPGA design process)
#
# Author:  Marvin Perzi
# Version: 2020-12-21
# 

transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work


# Name of test bench entity
set TestBench "tb_BinTo7SegV2"

# Add 
vcom -93 -work work {BinTo7SegV2.vhd}
vcom -93 -work work {tb_BinTo7SegV2.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  $TestBench

# Kombiniertes Signal 'Inputs' erstellen 
virtual signal {b3 & b2 & b1 & b0} Inputs 
 
# Kombiniertes Signal in Binärkodierung und in Hex- 
# Kodierung anzeigen 
add wave -label "InputsBin" Inputs 
add wave -radix hexadecimal -label "InputsHex" Inputs 
 
add wave -label "b3" b3 
add wave -label "b2" b2 
add wave -label "b1" b1 
add wave -label "b0" b0 
 
# Trennstrich mit Bezeichnung einfügen 
add wave -divider Ausgaenge: 
 
# Kombiniertes Signal 'Segments' erstellen 
virtual signal {a & b & c & d & e & f & g} Segments 
 
# Kombiniertes Signal in Binärkodierung anzeigen 
add wave -label "Segments" Segments 
 
add wave -label "a" a 
add wave -label "b" b 
add wave -label "c" c 
add wave -label "d" d 
add wave -label "e" e 
add wave -label "f" f 
add wave -label "g" g 

view structure
view signals
run 340 ns

wave zoom full
