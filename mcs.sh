#!/bin/bash


if [ $# -ne 0 ]
then

	MASTER=$1
	SLAVE=$2

#	export IIOD_REMOTE=$SLAVE

		# 8 pulses on pulse generator request
#		iio_reg hmc7044 0x5a 5
		
	#step 0 & 1
#		iio_attr  -q -d adrv9009-phy multichip_sync 0 >/dev/null 2>&1
#		iio_attr  -q -d adrv9009-phy-b multichip_sync 0 >/dev/null 2>&1
#		iio_attr  -q -d adrv9009-phy multichip_sync 1 >/dev/null 2>&1
#		iio_attr  -q -d adrv9009-phy-b multichip_sync 1 >/dev/null 2>&1
	
#	unset IIOD_REMOTE

	export IIOD_REMOTE=$MASTER

	
		# 8 pulses on pulse generator request
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
#	unset IIOD_REMOTE
		
#	export IIOD_REMOTE=$SLAVE
	#	iio_attr  -q -d adrv9009-phy multichip_sync 11 >/dev/null 2>&1
	#	iio_attr  -q -d adrv9009-phy-b multichip_sync 11 >/dev/null 2>&1
#	unset IIOD_REMOTE

#	export IIOD_REMOTE=$MASTER
	# step 3 & 4
		iio_attr  -q -d adrv9009-phy multichip_sync 3 # >/dev/null 2>&1
		iio_attr  -q -d adrv9009-phy-b multichip_sync 3 # >/dev/null 2>&1
		iio_attr  -q -d adrv9009-phy-c multichip_sync 3 # >/dev/null 2>&1
		iio_attr  -q -d adrv9009-phy-d multichip_sync 3 # >/dev/null 2>&1
		
		iio_attr  -q -d adrv9009-phy multichip_sync 4 # >/dev/null 2>&1
		iio_attr  -q -d adrv9009-phy-b multichip_sync 4 # >/dev/null 2>&1
		iio_attr  -q -d adrv9009-phy-c multichip_sync 4 # >/dev/null 2>&1
		iio_attr  -q -d adrv9009-phy-d multichip_sync 4 # >/dev/null 2>&1
#	unset IIOD_REMOTE
#	export IIOD_REMOTE=$SLAVE
#		iio_attr  -q -d adrv9009-phy multichip_sync 3 # >/dev/null 2>&1
#		iio_attr  -q -d adrv9009-phy-b multichip_sync 3 # >/dev/null 2>&1
#		iio_attr  -q -d adrv9009-phy multichip_sync 4 # >/dev/null 2>&1
#		iio_attr  -q -d adrv9009-phy-b multichip_sync 4 # >/dev/null 2>&1
#	unset IIOD_REMOTE
#	export IIOD_REMOTE=$MASTER
	# step 5
		iio_attr -q -d hmc7044-car sysref_request 1
	# step 6
		iio_attr  -q -d adrv9009-phy multichip_sync 6 >/dev/null 2>&1
		iio_attr  -q -d adrv9009-phy-b multichip_sync 6 >/dev/null 2>&1
		iio_attr  -q -d adrv9009-phy-c multichip_sync 6 >/dev/null 2>&1
		iio_attr  -q -d adrv9009-phy-d multichip_sync 6 >/dev/null 2>&1
#	unset IIOD_REMOTE
#	export IIOD_REMOTE=$SLAVE
#		iio_attr  -q -d adrv9009-phy multichip_sync 6 >/dev/null 2>&1
#		iio_attr  -q -d adrv9009-phy-b multichip_sync 6 >/dev/null 2>&1
#	unset IIOD_REMOTE
#	export IIOD_REMOTE=$MASTER
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
#	unset IIOD_REMOTE
#	export IIOD_REMOTE=$SLAVE
#		iio_attr  -q -d adrv9009-phy multichip_sync 8 >/dev/null 2>&1
#		iio_attr  -q -d adrv9009-phy-b multichip_sync 8 >/dev/null 2>&1
#		iio_attr  -q -d adrv9009-phy multichip_sync 9 >/dev/null 2>&1
#		iio_attr  -q -d adrv9009-phy-b multichip_sync 9 >/dev/null 2>&1
#	unset IIOD_REMOTE
#	export IIOD_REMOTE=$MASTER
	# step 10
		iio_attr -q -d hmc7044-car sysref_request 1
	# step 11
		iio_attr  -q -d adrv9009-phy multichip_sync 11 >/dev/null 2>&1
		iio_attr  -q -d adrv9009-phy-b multichip_sync 11 >/dev/null 2>&1
		iio_attr  -q -d adrv9009-phy-c multichip_sync 11 >/dev/null 2>&1
		iio_attr  -q -d adrv9009-phy-d multichip_sync 11 >/dev/null 2>&1

	# 8 pulses on pulse generator request
#		iio_reg hmc7044 0x5a 1
#	unset IIOD_REMOTE
#	export IIOD_REMOTE=$SLAVE
#		iio_attr  -q -d adrv9009-phy multichip_sync 11 >/dev/null 2>&1
#		iio_attr  -q -d adrv9009-phy-b multichip_sync 11 >/dev/null 2>&1
	
	# 8 pulses on pulse generator request
#		iio_reg hmc7044 0x5a 1
#	unset IIOD_REMOTE

	sleep 0.1
#	export IIOD_REMOTE=$MASTER
		iio_attr -q -d hmc7044-car sysref_request 1
#	unset IIOD_REMOTE

#	export IIOD_REMOTE=$SLAVE	
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
		iio_attr  -q -d adrv9009-phy-d calibrate_rx_phase_correction_en 1 >/dev/null 2>&1
		iio_attr  -q -d adrv9009-phy-d calibrate 1 >/dev/null 2>&1
#	unset IIOD_REMOTE

#	export IIOD_REMOTE=$MASTER
	# go back to 1 pulse / sysref request
#		iio_reg hmc7044 0x5a 1
	# cal RX phase correction
#		iio_attr  -q -d adrv9009-phy calibrate_rx_phase_correction_en 1 >/dev/null 2>&1
#		iio_attr  -q -d adrv9009-phy calibrate 1 >/dev/null 2>&1
#		iio_attr  -q -d adrv9009-phy-b calibrate_rx_phase_correction_en 1 >/dev/null 2>&1
#		iio_attr  -q -d adrv9009-phy-b calibrate 1 >/dev/null 2>&1

	#send one more sysref pulse in order to get initial frame sync??????	
		sleep 0.1
		iio_attr -q -d hmc7044-car sysref_request 1
		sleep 1
		iio_attr -q -d hmc7044-car sysref_request 1
		sleep 1
		iio_attr -q -d hmc7044-car sysref_request 1
		sleep 1
		iio_attr -q -d hmc7044-car sysref_request 1
		unset IIOD_REMOTE

	sleep 1
else
	echo master and slave IPs are needed as params

fi


