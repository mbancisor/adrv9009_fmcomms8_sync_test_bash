#!/bin/bash

if [ $# -ne 0 ]
then

	SLAVE=$2
	MASTER=$1

	export IIOD_REMOTE=$MASTER

		# disable RF seeder, doing it on SOM and Carrier breaks Sync
	#???#	iio_reg hmc7044-ext 0x3 0xf
		# SET SOM pulses to 8
		iio_reg	hmc7044 0x5a 0x4
		iio_reg hmc7044-fmc 0x5a 0x4

	unset IIOD_REMOTE
fi
