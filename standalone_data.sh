#!/bin/bash

#LO=1228800000

LO=1000000000

samples=1024
buffers=1024
  
##Get data -used for testing

iio_readdev -b $buffers -s $samples -T 10000 axi-adrv9009-rx-hpc voltage0_i voltage0_q voltage2_i voltage2_q voltage4_i voltage4_q voltage6_i voltage6_q > samples_master.dat
sleep 0.05
python3 main.py


