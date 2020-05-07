#!/bin/bash

iio_attr -c adrv9009-phy TRX_LO frequency $1
iio_attr -c adrv9009-phy-b TRX_LO frequency $1

iio_attr -c adrv9009-phy-c TRX_LO frequency $1
iio_attr -c adrv9009-phy-d TRX_LO frequency $1

iio_attr -c axi-adrv9009-tx-hpc TX1_I_F1 frequency 5000000
iio_attr -c axi-adrv9009-tx-hpc TX1_Q_F1 frequency 5000000

