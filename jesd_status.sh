#!/bin/bash

file="log_jesd.txt"
test=$(($1/3))

echo >>$file
echo >>$file
echo "test_nr: $test sample_nr: $1">>$file

cat /sys/devices/platform/fpga-axi\@0/84a50000.axi-jesd204-rx/status>>$file
cat /sys/devices/platform/fpga-axi\@0/84a50000.axi-jesd204-rx/lane0_info>>$file
cat /sys/devices/platform/fpga-axi\@0/84a50000.axi-jesd204-rx/lane1_info>>$file
cat /sys/devices/platform/fpga-axi\@0/84a50000.axi-jesd204-rx/lane2_info>>$file
cat /sys/devices/platform/fpga-axi\@0/84a50000.axi-jesd204-rx/lane3_info>>$file
cat /sys/devices/platform/fpga-axi\@0/84a50000.axi-jesd204-rx/lane4_info>>$file
cat /sys/devices/platform/fpga-axi\@0/84a50000.axi-jesd204-rx/lane5_info>>$file
cat /sys/devices/platform/fpga-axi\@0/84a50000.axi-jesd204-rx/lane6_info>>$file
cat /sys/devices/platform/fpga-axi\@0/84a50000.axi-jesd204-rx/lane7_info>>$file
