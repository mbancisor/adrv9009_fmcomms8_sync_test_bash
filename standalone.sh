#!/bin/bash

#LO=1228800000

LO=1000000000

samples=1024
buffers=1024
  
#init
	# disable RF seeder, doing it on SOM and Carrier breaks Sync
	#???#   iio_reg hmc7044-ext 0x3 0xf
	# SET SOM and FMCOMMS Sysref pulses to 8
        iio_reg hmc7044 0x5a 0x4
        iio_reg hmc7044-fmc 0x5a 0x4

# Unsync -- sleep -> wake up

	iio_reg hmc7044 0x1 0x61
	iio_reg hmc7044-fmc 0x1 0x01
	iio_reg hmc7044-car 0x1 0x61
	sleep 0.1
	iio_reg hmc7044-car 0x1 0x60
	sleep 0.1
	iio_reg hmc7044 0x1 0x60
	sleep 0.1
	iio_reg hmc7044-fmc 0x1 0x60
	sleep 0.1

# 7044 setup
        # CLK2 sync pin mode disabled to avoid false triggering
	#needs to be enabled if there is another master in the system
	iio_reg hmc7044-car 0x5 0x02

        # CLK3 sync pin mode as SYNC
        iio_reg hmc7044 0x5 0x43
        # CLK3 sync pin mode as SYNC
        iio_reg hmc7044-fmc 0x5 0x43


        # restart request for all 7044
        iio_reg hmc7044 0x1 0x62
        iio_reg hmc7044-fmc 0x1 0x62
        iio_reg hmc7044-car 0x1 0x62
	# restart from top of the clocking tree
        sleep 0.1
        iio_reg hmc7044-car 0x1 0x60
        sleep 0.1
        iio_reg hmc7044 0x1 0x60
        sleep 0.1
        iio_reg hmc7044-fmc 0x1 0x60
        sleep 0.1

# Syncronizing clocks (7044_setup is mandatory)
	# Sync pulse is always requested to the master clk and propagates to the system
	# once a level has been synced, sync pin mode needs to be changed to pulsor 
	# Reseed request to clk2 -----> syncs the output of CLK2 
        iio_reg hmc7044-car 0x1 0xE0
        iio_reg hmc7044-car 0x1 0x60
        sleep 0.1
        # pulse request to CLK2----> syncs the outputs of CLK3
        iio_attr -q -d hmc7044-car sysref_request 1
        sleep 0.1

        # CLK3 sync pin mode as Pulsor so it doesn't resync on next pulse
        iio_reg hmc7044 0x5 0x83
        iio_reg hmc7044-fmc 0x5 0x83

### Configure ADRVs....used for testing.	
	iio_attr -c adrv9009-phy TRX_LO frequency $LO
	iio_attr -c adrv9009-phy-b TRX_LO frequency $LO

	iio_attr -c adrv9009-phy-c TRX_LO frequency $LO
	iio_attr -c adrv9009-phy-d TRX_LO frequency $LO

	iio_attr -c axi-adrv9009-tx-hpc TX1_I_F1 frequency 5000000
	iio_attr -c axi-adrv9009-tx-hpc TX1_Q_F1 frequency 5000000

# MCS
	# 16 pulses on pulse generator request
	iio_reg hmc7044 0x5a 5
	iio_reg hmc7044-fmc 0x5a 5
	#step 0 & 1
	iio_attr  -q -d adrv9009-phy multichip_sync 0 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-b multichip_sync 0 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-c multichip_sync 0 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-d multichip_sync 0 >/dev/null 2>&1
		
	iio_attr  -q -d adrv9009-phy multichip_sync 1 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-b multichip_sync 1 >/dev/null 2>&1	
	iio_attr  -q -d adrv9009-phy-c multichip_sync 1 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-d multichip_sync 1 >/dev/null 2>&1	

	sleep 0.1
	# step 2
	iio_attr -q -d hmc7044-car sysref_request 1
	sleep 0.5
		
	# step 3 & 4
	iio_attr  -q -d adrv9009-phy multichip_sync 3 # >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-b multichip_sync 3 # >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-c multichip_sync 3 # >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-d multichip_sync 3 # >/dev/null 2>&1
		
	iio_attr  -q -d adrv9009-phy multichip_sync 4 # >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-b multichip_sync 4 # >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-c multichip_sync 4 # >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-d multichip_sync 4 # >/dev/null 2>&1
	
	# step 5
	iio_attr -q -d hmc7044-car sysref_request 1
	
	# step 6
	iio_attr  -q -d adrv9009-phy multichip_sync 6 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-b multichip_sync 6 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-c multichip_sync 6 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-d multichip_sync 6 >/dev/null 2>&1
	
	# step 7 
	iio_attr -q -d hmc7044-car sysref_request 1
	
	# step 8 & 9
	iio_attr  -q -d adrv9009-phy multichip_sync 8 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-b multichip_sync 8 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-c multichip_sync 8 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-d multichip_sync 8 >/dev/null 2>&1
	
	iio_attr  -q -d adrv9009-phy multichip_sync 9 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-b multichip_sync 9 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-c multichip_sync 9 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-d multichip_sync 9 >/dev/null 2>&1
	
	# step 10
	iio_attr -q -d hmc7044-car sysref_request 1
	# step 11
	iio_attr  -q -d adrv9009-phy multichip_sync 11 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-b multichip_sync 11 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-c multichip_sync 11 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-d multichip_sync 11 >/dev/null 2>&1

	sleep 0.1
	iio_attr -q -d hmc7044-car sysref_request 1
	# go back to 1 pulse / sysref request
	iio_reg hmc7044 0x5a 1
	iio_reg hmc7044-fmc 0x5a 1

	# cal RX phase correction
	iio_attr  -q -d adrv9009-phy calibrate_rx_phase_correction_en 1 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy calibrate 1 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-b calibrate_rx_phase_correction_en 1 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-b calibrate 1 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-c calibrate_rx_phase_correction_en 1 >/dev/null 2>&1
	iio_attr  -q -d adrv9009-phy-c calibrate 1 >/dev/null 2>&1

	#send one more sysref pulse in order to get initial frame sync??????	
	sleep 0.1
	iio_attr -q -d hmc7044-car sysref_request 1
	sleep 1
	iio_attr -q -d hmc7044-car sysref_request 1
	sleep 1
	iio_attr -q -d hmc7044-car sysref_request 1
	sleep 1
	iio_attr -q -d hmc7044-car sysref_request 1
	sleep 1	

#DMA ARM -- NOT needed in single FPGA system

##Get data -used for testing

iio_readdev -b $buffers -s $samples -T 10000 axi-adrv9009-rx-hpc voltage0_i voltage0_q voltage2_i voltage2_q voltage4_i voltage4_q voltage6_i voltage6_q > samples_master.dat
sleep 0.05
python3 main.py



