onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ROM1_opt

do {wave.do}

view wave
view structure
view signals

do {ROM1.udo}

run -all

quit -force
