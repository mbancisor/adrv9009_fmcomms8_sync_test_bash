#!/bin/bash

file="log_jesd.txt"
sample=$(($1*3))

echo >>$file
echo >>$file
echo "test_nr: $1 sample_nr: $sample" >>$file

cat /sys/devices/platform/fpga-axi\@0/84a50000.axi-jesd204-rx/status
cat /sys/devices/platform/fpga-axi\@0/84a50000.axi-jesd204-rx/lane0_info
cat /sys/devices/platform/fpga-axi\@0/84a50000.axi-jesd204-rx/lane1_info
cat /sys/devices/platform/fpga-axi\@0/84a50000.axi-jesd204-rx/lane2_info
cat /sys/devices/platform/fpga-axi\@0/84a50000.axi-jesd204-rx/lane3_info
cat /sys/devices/platform/fpga-axi\@0/84a50000.axi-jesd204-rx/lane4_info
cat /sys/devices/platform/fpga-axi\@0/84a50000.axi-jesd204-rx/lane5_info
cat /sys/devices/platform/fpga-axi\@0/84a50000.axi-jesd204-rx/lane6_info
cat /sys/devices/platform/fpga-axi\@0/84a50000.axi-jesd204-rx/lane7_info
